import 'package:flutter/material.dart';
import 'package:flutter_demo/main_screen.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController user_title_controller = TextEditingController();
  final TextEditingController user_date_controller = TextEditingController();
  final TextEditingController user_duration_controller = TextEditingController();
  final TextEditingController user_category_controller = TextEditingController();
  final TextEditingController user_info_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: user_title_controller,
                decoration: const InputDecoration(
                  labelText: 'Event Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter event title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: user_date_controller,
                decoration: const InputDecoration(
                  labelText: 'Date (05,30,2022) Month/Day/year',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter event date';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: user_duration_controller,
                decoration: const InputDecoration(
                  labelText: 'Duration (hours)',
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please enter your event duration";
                  }
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: user_category_controller,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if(value==null || value.isEmpty){
                    return "Please enter your event category.";
                  }
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: user_info_controller,
                decoration: const InputDecoration(
                  labelText: 'Specific information (optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final new_Event = SuEvent(
                      title: user_title_controller.text,
                      date: user_date_controller.text,
                      duration: user_duration_controller.text,
                      category: user_category_controller.text,
                      info: user_info_controller.text,
                    );
                    // For now, just show a simple confirmation
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Event Succesfully Created!'),
                        backgroundColor: Colors.green,
                      ),
                    );

                    Future.delayed(const Duration(milliseconds: 800),(){
                      Navigator.pop(context,new_Event);
                    });
                    // Here you could send the data somewhere or save it
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Create Event',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
