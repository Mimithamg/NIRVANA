import 'package:flutter/material.dart';

class SignOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Color(0xff132137),
        ),
        body: Center(
          child: Text(
            'This is the Discussions Page',
            style: TextStyle(fontSize: 20),
          ),
        ));
  }
}
