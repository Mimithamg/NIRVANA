import 'package:flutter/material.dart';
import 'settings_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  String hobby = '';
  String bio = '';
  bool isEditing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xff132137),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 148, 60, 60),
                  fontStyle: FontStyle.italic,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              enabled: isEditing,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Hobby'),
              onChanged: (value) {
                setState(() {
                  hobby = value;
                });
              },
              enabled: isEditing,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Bio'),
              onChanged: (value) {
                setState(() {
                  bio = value;
                });
              },
              enabled: isEditing,
            ),
            SizedBox(
              height: 48,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isEditing = !isEditing;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff132137), // Set the background color here
              ),
              child: Text(isEditing ? 'Create Profile' : 'Edit Profile'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            // Do nothing as it's already on the home screen
          } else if (index == 1) {
            _navigateToSettingsPage();
          }
        },
      ),
    );
  }

  void _navigateToSettingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }
}
