import 'package:flutter/material.dart';
import 'package:bookmarker/constants.dart';
import 'package:bookmarker/components/welcome_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  static const String id = 'signup_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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

            SizedBox(height: 10.0),

            Text(
              'Let\'s Start Here!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
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
                hintText: 'Enter your new password',
              ),
            ),

            SizedBox(
              height: 10.0,
            ),

            WelcomeButtons(
              title: 'Register',
              color: Colors.pinkAccent,
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                  // if(newUser != null) {
                  //   Navigator.pushNamed(context, mainpage)
                  // }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    eMessage = 'The password provided is too weak.';
                  } else if (e.code == 'email-already-in-use') {
                    eMessage = 'The account already exists for that email.';
                  }
                } catch (e) {
                  print(e);
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
