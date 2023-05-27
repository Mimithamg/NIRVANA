import 'package:flutter/material.dart';
import 'package:social_media/introduction_animation/main_screens/profile_page.dart';
import 'bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'discussions.dart';
import 'tutorials.dart';
import 'more.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xff132137),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, left: 16, right: 16),
            child: Image.asset('assets/images/helpImage.png'),
          ),
          Container(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'How can we help you?',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              'It looks like you are experiencing problems\nwith our sign up process. We are here to\nhelp so please get in touch with us',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          offset: const Offset(4, 4),
                          blurRadius: 8.0),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Chat with Us',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
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
          } else if (index == 2) {
            _navigateToDiscussionsPage(context);
          } else if (index == 3) {
            _navigateToMorePage(context);
          } else if (index == 4) {
            _navigateToTutorialsPage(context);
          }
        },
      ),
    );
  }
}

void _navigateToProfilePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfilePage()),
  );
}

void _navigateToMorePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MorePage()),
  );
}

void _navigateToDiscussionsPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DiscussionsPage()),
  );
}

void _navigateToTutorialsPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TutorialsPage()),
  );
}
