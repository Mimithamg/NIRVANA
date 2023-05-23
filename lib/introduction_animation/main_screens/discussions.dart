import 'package:flutter/material.dart';
import 'package:social_media/introduction_animation/main_screens/profile_page.dart';
import 'bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'more.dart';
import 'tutorials.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class DiscussionsPage extends StatefulWidget {
  @override
  _DiscussionsPageState createState() => _DiscussionsPageState();
}

class _DiscussionsPageState extends State<DiscussionsPage> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discussions'),
        backgroundColor: Color(0xff132137),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              'assets/images/discussions.jpg'), // Replace with your image asset path
          Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _navigateToPostDiscussionPage(context);
                  },
                  child: Text('Host a Discussion'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _navigateToJoinDiscussionPage();
                  },
                  child: Text('Join a Discussion'),
                ),
              ],
            ),
          ),
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
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          if (index == 0) {
            _navigateToProfilePage(context);
          } else if (index == 1) {
            _navigateToSettingsPage(context);
          } else if (index == 2) {
            // Do nothing as it's already on the discussions page
          } else if (index == 3) {
            _navigateToMorePage(context);
          } else if (index == 4) {
            _navigateToTutorialsPage(context);
          }
        },
      ),
    );
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

  void _navigateToPostDiscussionPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostDiscussionPage()),
    );

    if (result == true) {
      _showNotification('Hosted discussion successfully');
    }
  }

  void _showNotification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _navigateToJoinDiscussionPage() async {
    final selectedTopic = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Join a Discussion'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Select a topic:'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Topic 1');
                },
                child: Text('Mental Health Improvement'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Topic 2');
                },
                child: Text('How Hobbies Effect you'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Topic 3');
                },
                child: Text('Your Experiences'),
              ),
            ],
          ),
        );
      },
    );

    if (selectedTopic != null) {
      // Perform any action with the selected topic
      print('Selected topic: $selectedTopic');
    }
  }
}

class PostDiscussionPage extends StatefulWidget {
  @override
  _PostDiscussionPageState createState() => _PostDiscussionPageState();
}

class _PostDiscussionPageState extends State<PostDiscussionPage> {
  final TextEditingController _topicController = TextEditingController();
  bool _discussionPosted = false;
  String _postedTopic = '';

  void _postDiscussion(BuildContext context) {
    // Perform any logic with the entered topic
    final topic = _topicController.text;

    // Assuming the discussion is successfully posted
    setState(() {
      _discussionPosted = true;
      _postedTopic = topic;
    });

    _showNotification(context, 'Hosted discussion successfully');
  }

  void _showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Discussion'),
        backgroundColor: Color(0xff132137),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _topicController,
              decoration: InputDecoration(
                labelText: 'Topic',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _postDiscussion(context);
              },
              child: Text('Post'),
            ),
            if (_discussionPosted)
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Posted Topic:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _postedTopic,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
