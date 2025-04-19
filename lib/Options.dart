import 'package:flutter/material.dart';
import 'package:flutter_demo/categories.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SuConnect",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          _buildSectionTitle('Account'),
          _buildTile('Name'),
          _buildTile('Last Name'),
          _buildTile('Age'),
          const SizedBox(height: 60),
          _buildSectionTitleWithIcon('Notifications', Icons.notifications_none),
          SwitchListTile(
            title: const Text(
              'Allow Notifications',
              style: TextStyle(fontSize: 16),
            ),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
            activeColor: Colors.blue,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          _buildTile('Categories', destinationPage: const CategoriesPage()),
          const SizedBox(height: 20),
          SizedBox(height: 60),
          _buildSectionTitle('Locations'),
          _buildTile('Campus'),
          _buildTile('Istanbul'),
          _buildTile('Other'),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 0, 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget _buildSectionTitleWithIcon(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 0, 10),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const SizedBox(width: 8),
          Icon(icon, size: 20),
        ],
      ),
    );
  }

  Widget _buildTile(String title, {Widget? destinationPage}) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(fontSize: 16),
    ),
    onTap: destinationPage != null
        ? () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destinationPage), // Navigate to the widget
            );
          }
        : null, // If no page is passed, do nothing
    tileColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
  );
}
  
}
