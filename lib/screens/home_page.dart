import 'package:flutter/material.dart';
import 'package:mitup/models/interest.dart';
import 'package:mitup/models/post.dart';
import 'package:mitup/screens/DashboardHome.dart';
import 'package:mitup/screens/accountProfile.dart';
import 'package:mitup/screens/filtered_interest.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final List<Widget> _page = [
    const DashboardHome(),
    const FilteredInterest(),
    const AccountProfile(),
    const AccountProfile()
  ];
  int selectedIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
    print(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: selectedIndex,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
         ],
      ),
    );
  }
}