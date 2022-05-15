// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import "package:flutter/material.dart";
import 'package:my_app/screens/account_screen.dart';
import 'package:my_app/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Material App Bar $currentPage',
              style: TextStyle(color: Colors.black)),
          elevation: 1),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          CustomScreen(color: Colors.white),
          AccountScreen(),
          SettingsScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (index) {
            currentPage = index;
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeOut);
            setState(() {});
          },
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ]),
    );
  }
}

class CustomScreen extends StatelessWidget {
  final Color color;

  const CustomScreen({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color, child: Center(child: Text('Hello World, working')));
  }
}
