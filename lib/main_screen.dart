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
                // Navigate to Settings page when settings icon is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()), // Settings page
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
              GestureDetector(
                onTap: () {
                  // Navigate to Upcoming Events page when title is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UpcomingEventsPage()), // Upcoming events page
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Upcoming Events',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.calendar_today, size: 24, color: Colors.black),
                    ],
                  ),
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
                          // "Join" Button
                          ElevatedButton(
                            onPressed: () {
                              // Show a SnackBar when the button is pressed
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('You have joined ${event.title}')),
                              );
                            },
                            child: const Text('Join'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Button color
                              foregroundColor: Colors.white, // Text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // Rounded corners
                              ),
                            ),
                          ),
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
                          // "Join" Button
                          ElevatedButton(
                            onPressed: () {
                             
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('You have joined ${event.title}')),
                              );
                            },
                            child: const Text('Join'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Button color
                              foregroundColor: Colors.white, // Text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // Rounded corners
                              ),
                            ),
                          ),
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
    // Wait for the new event to be created and returned
    final newEvent = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateEventScreen()),
    );

    // If a new event was returned, add it to the event list
    if (newEvent != null) {
      setState(() {
        myEvents.add(newEvent);  // Add the event to your events list
      });
    }
  },
  child: const Icon(Icons.add),
  backgroundColor: Colors.blue,
),

    );
  }
}
