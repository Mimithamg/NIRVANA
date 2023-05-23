import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => ProfilePage(),
    '/settings': (context) => SettingsPage(),
    // Add more routes if necessary
  };
}
