import 'package:flutter/material.dart';
import 'package:mitup/models/interest.dart';
import 'package:mitup/models/post.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Image.asset("assets/avatars/Rectangle 13.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120.0),
                  child: Row(
                    children: const [
                      Text(
                        'Safe',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(91, 144, 148, 1.0)),
                      ),
                      Text(
                        'Space',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(20, 38, 100, 1.0)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Filter"),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: INTERESTS
                            .map((element) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(25),
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.black45,
                                      style: BorderStyle.solid)),
                              child: Text(element.interestName),
                            ),
                          ),
                        ))
                            .toList()),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                        shrinkWrap: true,
                        primary: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: THREADS.length,
                        itemBuilder: (context, index) => Container(
                          padding:
                          const EdgeInsets.only(bottom: 10, top: 10),
                          child: Column(
                            children: [
                              Row(children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(right: 8.0),
                                  child: CircleAvatar(
                                    child: Image.asset(
                                        THREADS[index].imageFile),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      THREADS[index].postTitle,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      THREADS[index].postSubTitle,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ]),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0),
                                child: Text(
                                  THREADS[index].postDescription,
                                  style: const TextStyle(height: 1.5),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.black26,
                                      ),
                                      Text(
                                        "21",
                                        style: TextStyle(
                                          color: Colors.black26,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.arrow_upward_outlined,
                                        color: Colors.black26,
                                      ),
                                      Text(
                                        "121",
                                        style: TextStyle(
                                          color: Colors.black26,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.more_time,
                                        color: Colors.black26,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.flag,
                                        color: Colors.black26,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  color: Colors.black38,
                                  height: 1,
                                ),
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}