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
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, left: 16, right: 16),
            child: Image.asset('assets/images/inviteImage.png'),
          ),
          Container(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Invite Your Friends',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              'Are you one of those who makes everything\n at the last moment?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color.fromARGB(255, 187, 184, 184)
                              .withOpacity(0.6),
                          offset: const Offset(4, 4),
                          blurRadius: 8.0),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        //method here for functionality
                        print('Share Action.');
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 22,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Share',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
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
