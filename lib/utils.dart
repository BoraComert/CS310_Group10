import 'package:flutter/material.dart';

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




class Utilities {
  static AppBar appBar(String title,Color color_) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: color_, // veya istediğin renk
    );
  }

  static TextFormField customTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
    );
  }
  static Text privacy_info(){
    return Text(
      "By using this app, you agree to our Terms of Service and Privacy Policy. We respect your privacy and only collect the information necessary to provide and improve our services. Your data will never be shared with third parties without your consent. You can read the full Terms and Policy in the settings menu. If you have any questions, feel free to contact us.",
              style: TextStyle(fontSize: 20),
    );
  }

}
