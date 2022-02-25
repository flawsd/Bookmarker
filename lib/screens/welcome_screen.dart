import 'package:flutter/material.dart';
import 'package:bookmarker/screens/login_screen.dart';
import 'package:bookmarker/screens/signup_screen.dart';
import 'package:bookmarker/components/welcome_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //This is all for the Logo and Title
            const SizedBox(
              //~ for space before logo
              height: 55.0,
            ),
            Container(
              //~ putting logo
              child: Image.asset(
                'images/bookmarker.png',
                height: 300,
              ),
            ),
            const Text(
              // ~ title of the app
              'Bookmarker',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
              ),
            ),

            //This is for login button.
            WelcomeButtons(
              title: 'Login',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),

            //This is for the Sign-Up button
            WelcomeButtons(
              title: 'Sign-Up',
              color: Colors.pinkAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
