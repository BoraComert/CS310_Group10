import 'package:flutter/material.dart';
import 'package:flutter_demo/Login.dart';
import 'package:flutter_demo/Options.dart';
import 'Create_Event_Screen.dart';
import 'Upcoming_events.dart'; 
import 'utils.dart';


class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key});

  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  final List<SuEvent> events = [
    SuEvent(
      title: 'Art Exhibition',
      date: 'April 20, 2025',
      duration: '2 hours',
      category: 'Art',
      info: 'An exhibition showcasing local artists.',
    ),
    SuEvent(
      title: 'Tech Talk: Flutter',
      date: 'April 22, 2025',
      duration: '1.5 hours',
      category: 'Technology',
      info: 'A talk about developing apps with Flutter.',
    ),
    SuEvent(
      title: 'Music Night',
      date: 'April 25, 2025',
      duration: '3 hours',
      category: 'Entertainment',
      info: 'Live performances by student bands.',
    ),
  ];

  final List<SuEvent> myEvents = [
    SuEvent(
      title: 'Private Tech Workshop',
      date: 'April 21, 2025',
      duration: '2 hours',
      category: 'Technology',
      info: 'Exclusive workshop on Flutter development.',
    ),
    SuEvent(
      title: 'Charity Concert',
      date: 'April 23, 2025',
      duration: '3 hours',
      category: 'Charity',
      info: 'A concert for charity with various performances.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'SuConnect',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              // Tappable Upcoming Events title
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => UpcomingEventsPage()),
                              );
                            },
                        child: Row(
                                children: const [
                                  Text(
                                  'Upcoming Events',
                                   style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  ),
                                ),
                          SizedBox(width: 8),
                          Icon(Icons.calendar_today, size: 24, color: Colors.black),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Upcoming Events List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFE0E0E0),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                        childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
                        title: Text(event.title),
                        subtitle: Text('${event.date} • ${event.category}'),
                        children: [
                          const SizedBox(height: 8),
                          Text('Duration: ${event.duration}'),
                          const SizedBox(height: 4),
                          Text('Info: ${event.info}'),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Padding(
  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      'My Events',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  ),
),

              const SizedBox(height: 10),
              // My Events List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: myEvents.length,
                itemBuilder: (context, index) {
                  final event = myEvents[index];
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFE0E0E0),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                        childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
                        title: Text(event.title),
                        subtitle: Text('${event.date} • ${event.category}'),
                        children: [
                          const SizedBox(height: 8),
                          Text('Duration: ${event.duration}'),
                          const SizedBox(height: 4),
                          Text('Info: ${event.info}'),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newEvent = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateEventScreen()),
          );
          if (newEvent != null && newEvent is SuEvent) {
            setState(() {
              myEvents.add(newEvent);
            });
          }
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
