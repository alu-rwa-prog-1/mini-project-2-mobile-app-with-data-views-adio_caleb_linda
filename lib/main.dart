
import 'package:flutter/material.dart';
import "package:week3/onboarding.dart";

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
        ),
      home: Onboarding()
    );
  }
}
