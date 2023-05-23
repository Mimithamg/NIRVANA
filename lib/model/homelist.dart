//import 'package:best_flutter_ui_templates/design_course/home_design_course.dart';
//import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
//import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<HomeList> _pages = HomeList.homeList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _pages[_currentIndex].navigateScreen!,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: _buildBottomNavigationBarItems(),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return _pages.map((page) {
      return BottomNavigationBarItem(
        icon: Image.asset(
          page.imagePath,
          width: 24,
          height: 24,
        ),
        label: '',
      );
    }).toList();
  }
}

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
      navigateScreen: IntroductionAnimationScreen(),
    ),
  ];
}

class IntroductionAnimationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Introduction Animation Screen'),
    );
  }
}
