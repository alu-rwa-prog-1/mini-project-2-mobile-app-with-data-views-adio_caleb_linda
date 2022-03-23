import 'package:flutter/material.dart';
import 'package:mitup/models/interest.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Safe',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(91, 144, 148, 1.0)),
                          ),
                          Text(
                            'Space',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(20, 38, 100, 1.0)),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/home-page");
                          },
                          child: const Text("Next"))
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 40,
                  child: Image.asset("assets/avatars/Rectangle 14.png"),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 30),
                  child: Text(
                    "Kaola4",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const Text(
                  "Please choose atleast three element",
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    "You can choose from the following interests",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black26),
                  ),
                ),
                GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 190,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.3,
                    ),
                    children: INTERESTS
                        .map((element) => Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Colors.black26,
                                style: BorderStyle.solid)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                                heightFactor: 7.0,
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(element.interestName),
                                ))
                          ],
                        )))
                        .toList()),
              ],
            ),
          ),
        ));
  }
}