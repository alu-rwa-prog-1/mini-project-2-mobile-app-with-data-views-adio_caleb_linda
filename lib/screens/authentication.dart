import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:mitup/screens/loginscreen.dart';
import 'package:mitup/screens/signUpScreen.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              width: double.infinity,
              child: Row(
                children: const [
                  Text(
                    '    Safe',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.normal,
                        color: Color.fromRGBO(91, 144, 148, 1.0)),
                  ),
                  Text(
                    'Space',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.normal,
                        color: Color.fromRGBO(20, 38, 100, 1.0)),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ContainedTabBarView(
                tabBarProperties: const TabBarProperties(
                    labelColor: Color.fromRGBO(91, 144, 148, 1.0),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    unselectedLabelColor: Color.fromRGBO(91, 144, 148, 1.0)),
                tabs: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Login',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Sign Up",
                    ),
                  ),
                ],
                views: const [
                  LoginScreen(),
                  SignUpScreen(),
                ],
                // ignore: avoid_print
                onChange: (index) => print(index),
                initialIndex: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}