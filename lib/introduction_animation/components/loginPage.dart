import 'package:flutter/material.dart';
import 'package:social_media/navigation_home_screen.dart';
import 'package:social_media/introduction_animation/main_screens/profile_page.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Sign Up'),
      ),*/
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/introduction_animation/login_img.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(height: 24),
              Container(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  //obscureText: true,
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 16),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 58,
                    padding: EdgeInsets.only(
                      left: 56.0,
                      right: 56.0,
                      top: 16,
                      bottom: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(38.0),
                      color: Color(0xff132137),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text(
                  'Already have an account? Log in',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff132137),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/introduction_animation/login_img.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 16),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigationHomeScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 58,
                    padding: EdgeInsets.only(
                      left: 56.0,
                      right: 56.0,
                      top: 16,
                      bottom: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(38.0),
                      color: Color(0xff132137),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ),
                  );
                },
                child: Text(
                  'Don\'t have an account? Sign up',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff132137),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
