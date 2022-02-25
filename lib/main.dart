import 'package:flutter/material.dart';
import 'package:bookmarker/screens/welcome_screen.dart';
import 'package:bookmarker/screens/signup_screen.dart';
import 'package:bookmarker/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Bookmarker());
}

class Bookmarker extends StatelessWidget {
  const Bookmarker({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        //'bookmarker_page': (context) => MainBookScreen();
      },
    );
  }
}
