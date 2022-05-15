// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import "package:flutter/material.dart";
import 'package:my_app/screens/account_screen.dart';
import 'package:my_app/screens/settings_screen.dart';
import 'package:audioplayers/audioplayers.dart';

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
          title: Text('My first app', style: TextStyle(color: Colors.black)),
          elevation: 1),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          SingleChildScrollView(
            child: CustomScreen(color: Colors.white),
          ),
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
      color: color,
      child: Column(children: <Widget>[
        Container(
          color: Color.fromARGB(255, 46, 46, 46),
          child: Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 80, 20, 80),
                  child: Text(
                    'Hello World, working',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))),
        ),
        Container(
            margin: EdgeInsets.only(top: 40),
            child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Container(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text('1'),
                          Text('2'),
                          Text('3'),
                          Text('4'),
                          Text('5'),
                        ],
                      ),
                    )))),
        Container(
          margin: EdgeInsets.only(top: 30),
          child: FlatButton(
              onPressed: () {
                final player = AudioCache();
                player.play('timbre.mp3');
              },
              color: Colors.red,
              child: Text('Timbre', style: TextStyle(color: Colors.white))),
        ),
        Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.only(top: 120),
            child: Text(
              'Lorem ipsum',
              style: TextStyle(fontSize: 40),
            )),
        Container(
            margin: EdgeInsets.only(top: 10),
            child: Image(
              image: AssetImage('assets/image.jpg'),
            )),
        Container(
            margin: EdgeInsets.only(top: 10, bottom: 50),
            child: Image(
              image: AssetImage('assets/image-2.jpg'),
            ))
      ]),
    );
  }
}
