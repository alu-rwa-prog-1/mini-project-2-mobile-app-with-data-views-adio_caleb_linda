import 'package:flutter/material.dart';
import 'package:mitup/screens/interestScreen.dart';
import 'package:mitup/screens/authentication.dart';
import 'package:mitup/screens//home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MitUp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => const Authentication(),
        "/create-interest": (context) => const InterestScreen(),
        "/home-page": (context) => const HomePageScreen()
      },
    );
  }
}