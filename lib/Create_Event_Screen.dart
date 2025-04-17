import 'package:flutter/material.dart';
import 'package:flutter_demo/main_screen.dart';
import 'utils.dart';

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
      appBar: Utilities.appBar("Create Event",Colors.white),
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Utilities.customTextField(
                controller: user_title_controller,
                label: "Event Title",
                
              ),
              
              const SizedBox(height: 12),
              Utilities.customTextField(
                controller: user_date_controller,
                label: "Date (05,30,2022) Month/Day/year",
              ),
              
              const SizedBox(height: 12),

              Utilities.customTextField(
                controller: user_duration_controller,
                label: "Duration (Hours)",
              ),
              
              const SizedBox(height: 12),
              Utilities.customTextField(
                controller: user_category_controller,
                label: "Category",
              ),
              
              const SizedBox(height: 12),
              Utilities.customTextField(
                controller: user_info_controller,
                label: "Specific information (optional)",
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
