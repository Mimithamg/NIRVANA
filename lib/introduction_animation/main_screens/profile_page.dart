import 'package:flutter/material.dart';
import 'package:social_media/introduction_animation/main_screens/discussions.dart';
import 'package:social_media/introduction_animation/main_screens/more.dart';
import 'package:social_media/introduction_animation/main_screens/tutorials.dart';
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
                labelStyle: TextStyle(
                    color: Color(0xff132137),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              enabled: isEditing,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Hobby',
                labelStyle: TextStyle(
                    color: Color(0xff132137),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onChanged: (value) {
                setState(() {
                  hobby = value;
                });
              },
              enabled: isEditing,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Bio',
                labelStyle: TextStyle(
                    color: Color(0xff132137),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
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
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Discussions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: 'More',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Tutorials',
          ),
        ],
        unselectedItemColor:
            Colors.blue, // Set the color for all unselected items
        selectedItemColor: Colors.blue,
        //selectedItemColor: Colors.black,
        onTap: (int index) {
          if (index == 0) {
            // Do nothing as it's already on the home screen
          } else if (index == 1) {
            _navigateToSettingsPage();
          } else if (index == 2) {
            _navigateToDiscussionsPage();
          } else if (index == 3) {
            _navigateToMorePage();
          } else if (index == 4) {
            _navigateToTutorialsPage();
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

  void _navigateToMorePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MorePage()),
    );
  }

  void _navigateToDiscussionsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DiscussionsPage()),
    );
  }

  void _navigateToTutorialsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TutorialsPage()),
    );
  }
}
