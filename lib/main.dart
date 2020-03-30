import 'package:appointment_consultation/screens/home.dart';
import 'package:appointment_consultation/screens/login.dart';
import 'package:appointment_consultation/screens/signup.dart';
import 'package:appointment_consultation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff49B4BB),
        scaffoldBackgroundColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              button: TextStyle(
                color: Colors.white,
              ),
            ),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              color: Colors.white,
            ),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              buttonColor: Color(0xff49B4BB),
            ),
      ),
      initialRoute: 'Login',
      routes: {
        '/': (context) => SplashScreen(),
        'Login': (context) => Login(),
        'Signup': (context) => Signup(),
        'Home': (context) => Home(),
      },
    );
  }
}
