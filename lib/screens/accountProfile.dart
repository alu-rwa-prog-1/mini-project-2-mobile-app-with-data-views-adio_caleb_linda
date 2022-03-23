import 'package:flutter/material.dart';

class AccountProfile extends StatefulWidget {
  const AccountProfile({Key? key}) : super(key: key);

  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                child: Image.asset("assets/empty.jpg"),
              ),
            ),
            const Text(
              "Still in development",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}