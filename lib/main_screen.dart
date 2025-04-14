import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: Text(
          "SuConnect",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
          actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
        body: EventListScreen(),
          
          
                       
                       
      
     ),
     );
    
  }
}

class SuEvent {
  final String title;
  final String date;
  final String duration;
  final String category;
  final String info;

  SuEvent({
    required this.title,
    required this.date,
    required this.duration,
    required this.category,
    required this.info,
  });
}

class EventListScreen extends StatelessWidget {
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

  EventListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events'),
        
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE0E0E0), // Light gray divider
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
       floatingActionButton: FloatingActionButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CreateEventScreen()),
      );
    },
    child: const Icon(Icons.add),
    backgroundColor: Colors.blue,
  ),
    );
  }
}

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: const Center(
        child: Text('Event creation form will go here.'),
      ),
     
    );
  }
}

      

