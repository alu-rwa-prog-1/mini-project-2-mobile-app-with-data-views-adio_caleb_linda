import 'package:flutter/material.dart';
import 'package:mitup/models/interest.dart';
import 'package:mitup/widgets/feedWidget.dart';

class FilteredInterest extends StatefulWidget {
  const FilteredInterest({Key? key}) : super(key: key);

  @override
  State<FilteredInterest> createState() => _FilteredInterestState();
}

class _FilteredInterestState extends State<FilteredInterest> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: const EdgeInsets.only(
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "INTERESTS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      labelText: 'Search',
                      labelStyle: const TextStyle(fontSize: 12),
                      suffixIcon: const Icon(Icons.search),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20)),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Fill your email";
                    }

                    return null;
                  },
                  onSaved: (value) {},
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Trendings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const FeedInterest(),
              const FeedInterest(),
              const FeedInterest(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Your Interest",
                      style: TextStyle(color: Color.fromRGBO(91, 144, 148, 1.0)),
                    ),
                    Text("View All",
                        style:
                        TextStyle(color: Color.fromRGBO(91, 144, 148, 1.0)))
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: INTERESTS
                        .map((element) => Container(
                      color: const Color.fromRGBO(91, 144, 148, 1.0),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 3),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      child: Text(
                        element.interestName,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ))
                        .toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Explore Interests",
                      style: TextStyle(color: Color.fromRGBO(91, 144, 148, 1.0)),
                    ),
                    Text("View All",
                        style:
                        TextStyle(color: Color.fromRGBO(91, 144, 148, 1.0)))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 190,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 4.4,
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
                                heightFactor: 1.7,
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(element.interestName),
                                ))
                          ],
                        )))
                        .toList()),
              ),
            ],
          )),
    );
  }
}