import 'package:flutter/material.dart';
import 'package:travel/pages/home_screen.dart';
import 'package:travel/pages/signin_screen.dart';
import 'package:travel/pages/signup_screen.dart';
import 'package:travel/pages/places_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/places': (context) => const PlacesPage(username: 'User'), // Corrected route for PlacesPage
      },
    );
  }
}
