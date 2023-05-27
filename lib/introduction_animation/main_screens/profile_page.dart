import 'package:flutter/material.dart';
import 'package:social_media/introduction_animation/main_screens/discussions.dart';
import 'package:social_media/introduction_animation/main_screens/drawer.dart';
import 'package:social_media/introduction_animation/main_screens/more.dart';
import 'package:social_media/introduction_animation/main_screens/tutorials.dart';
import 'settings_page.dart';
import 'profile.dart';
import 'sign_out_page.dart';
import 'post_picture_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> uploadedImageUrls = [];
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
      drawer: MyDrawer(
        onProfileTap: _goToProfile,
        onSignOut: _goToSignOut,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 48,
            ),
            Container(
              child: Center(
                child: Text(
                  "Posts",
                ),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostPicturePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.grey[600], // Set the desired background color
                ),
                child: Text('create post'),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Post(imageUrls: uploadedImageUrls)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.grey[600], // Set the desired background color
                ),
                child: Text('Your Posts'),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Image.asset('assets/images/posts.png'),
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

  void _goToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Profile()),
    );
  }

  void _goToSignOut() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignOutPage()),
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
