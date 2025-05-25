import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'utils.dart';

class UpcomingEventsPage extends StatefulWidget {
  const UpcomingEventsPage({super.key});

  @override
  State<UpcomingEventsPage> createState() => _UpcomingEventsPageState();
}

class _UpcomingEventsPageState extends State<UpcomingEventsPage> {
  Map<DateTime, List<SuEvent>> _events = {};
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('events')
          .orderBy('date')
          .get();

      final Map<DateTime, List<SuEvent>> loadedEvents = {};

      for (var doc in snapshot.docs) {
        final data = doc.data();

        // Skip if 'date' is missing or invalid
        if (!data.containsKey('date') || data['date'] == null) continue;

        DateTime eventDate;

        if (data['date'] is Timestamp) {
          eventDate = (data['date'] as Timestamp).toDate();
        } else if (data['date'] is String) {
          eventDate = DateTime.tryParse(data['date']) ?? DateTime.now();
        } else {
          eventDate = DateTime.now();
        }

        final normalizedDate = DateTime.utc(eventDate.year, eventDate.month, eventDate.day);

        final event = SuEvent(
          title: data['title'] ?? '',
          date: eventDate,
          duration: data['duration']?.toString() ?? '',
          category: data['category']?.toString() ?? '',
          info: data['info']?.toString() ?? '',
        );

        if (loadedEvents[normalizedDate] == null) {
          loadedEvents[normalizedDate] = [event];
        } else {
          loadedEvents[normalizedDate]!.add(event);
        }
      }

      setState(() {
        _events = loadedEvents;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading events: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<SuEvent> _getEventsForDay(DateTime day) {
    final normalizedDay = DateTime.utc(day.year, day.month, day.day);
    return _events[normalizedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upcoming Events")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                TableCalendar<SuEvent>(
                  focusedDay: _focusedDay,
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  calendarFormat: CalendarFormat.month,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  eventLoader: _getEventsForDay,
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    markerDecoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    children: _getEventsForDay(_selectedDay ?? _focusedDay)
                        .map(
                          (event) => ListTile(
                            title: Text(event.title),
                            subtitle: Text("${event.category} • ${event.duration}"),
                            trailing: const Icon(Icons.event),
                            onTap: () => _showEventInfo(context, event),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
    );
  }

  void _showEventInfo(BuildContext context, SuEvent event) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(event.title),
        content: Text(event.info),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
