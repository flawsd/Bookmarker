import 'package:flutter/material.dart';
import 'package:bookmarker/constants.dart';
import 'package:bookmarker/components/welcome_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  String eMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 150,
              child: Image.asset('images/bookmarker.png'),
            ),

            SizedBox(
              height: 30.0,
            ),

            //email box
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextField_Decoration.copyWith(
                hintText: 'Enter your email',
              ),
            ),

            SizedBox(
              height: 10.0,
            ),

            //password box
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextField_Decoration.copyWith(
                hintText: 'Enter your password',
              ),
            ),

            SizedBox(
              height: 10.0,
            ),

            WelcomeButtons(
              title: 'Log In',
              color: Colors.lightBlue,
              onPressed: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email, password: password);
                  //if (user!= null) {
                  //  Navigator.pushNamed(context, mainpage);
                  //}
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    eMessage = 'No user found for that email.';
                  } else if (e.code == 'wrong-password') {
                    eMessage = 'Wrong password provided for that user.';
                  }
                }
              },
            ),

            SizedBox(
              height: 10.0,
            ),

            Text(
              eMessage,
              style: TextStyle(
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
