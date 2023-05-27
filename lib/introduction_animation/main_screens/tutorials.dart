import 'package:flutter/material.dart';
import 'package:social_media/introduction_animation/main_screens/profile_page.dart';
import 'bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'settings_page.dart';
import 'more.dart';
import 'discussions.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TutorialsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorials'),
        backgroundColor: Colors.grey[600],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset('assets/images/yt.png'),
          SizedBox(
            height: 50,
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TutorialVideosPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set the desired background color
              ),
              child: Text('YouTube Tutorials'),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set the desired background color
              ),
              child: Text('  Create Tutorial  '),
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
            _navigateToMorePage(context);
          } else if (index == 4) {}
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

void _navigateToSettingsPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SettingsPage()),
  );
}

//import 'package:flutter/material.dart';

class TutorialVideosPage extends StatelessWidget {
  // List of YouTube video IDs
  List<String> videoIds = [
    'GMSC95hEj2w',
    'inpok4MKVLM',
    //'MpOg_vwPuMQ',
    'hM5M2Fu0RtY',
    'aAxGTnVNJiE',
    '8vkYJf8DOsc',
    '5ksC0Yl348o',
    'MSdqEhO1egc',
    // Add more video IDs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Tutorial Videos',
          ),
          backgroundColor: Colors.grey[900]),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: videoIds.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: videoIds[index],
                        flags: YoutubePlayerFlags(
                          autoPlay: false,
                          mute: false,
                        ),
                      ),
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.blueAccent,
                      progressColors: ProgressBarColors(
                        playedColor: Colors.blueAccent,
                        handleColor: Colors.blueAccent,
                      ),
                      onReady: () {
                        // Perform any additional operations when video is ready
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
