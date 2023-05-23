import 'package:flutter/material.dart';
import 'package:social_media/introduction_animation/main_screens/profile_page.dart';
import 'bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'discussions.dart';
import 'profile_page.dart';
import 'settings_page.dart';
import 'tutorials.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
        backgroundColor: Color(0xff132137),
      ),
      body: Center(
        child: Text(
          'This is the Page',
          style: TextStyle(fontSize: 20),
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
          onTap: (int index) {
            if (index == 0) {
              _navigateToProfilePage(context);
            } else if (index == 1) {
              _navigateToSettingsPage(context);
            } else if (index == 2) {
              _navigateToDiscussionsPage(context);
            } else if (index == 3) {
            } else if (index == 4) {
              _navigateToTutorialsPage(context);
            }
          }),
    );
  }
}

void _navigateToProfilePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfilePage()),
  );
}

void _navigateToTutorialsPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TutorialsPage()),
  );
}

void _navigateToSettingsPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SettingsPage()),
  );
}

void _navigateToDiscussionsPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DiscussionsPage()),
  );
}
