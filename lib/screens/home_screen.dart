import "package:flutter/material.dart";
import 'package:my_app/screens/account_screen.dart';
import 'package:my_app/screens/settings_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:my_app/utils/theme_colors.dart';

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
          title:
              const Text('My first app', style: TextStyle(color: Colors.black)),
          elevation: 1),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
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
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut);
            setState(() {});
          },
          elevation: 10,
          selectedItemColor: primaryColor,
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

  const CustomScreen({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: color,
      child: Column(children: const <Widget>[
        Section1(),
        Section2(),
        Section3(),
        Section4(),
        ImageRender(
          fileName: "image.jpg",
          margin: EdgeInsets.only(bottom: 20),
        ),
        ImageRender(
            fileName: "image-2.jpg", margin: EdgeInsets.only(bottom: 80))
      ]),
    ));
  }
}

class Section1 extends StatelessWidget {
  const Section1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      width: (MediaQuery.of(context).size.width),
      height: 250,
      alignment: Alignment.center,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Hello World',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 223, 223, 223)),
            ),
            Text(
              'With Flutter',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            )
          ]),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 40),
        child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  padding: const EdgeInsets.only(left: 40, right: 40),
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
                ))));
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: TextButton(
          onPressed: () {
            final player = AudioCache();
            player.play('timbre.mp3');
          },
          style: TextButton.styleFrom(backgroundColor: primaryColor),
          child: const Text('Timbre', style: TextStyle(color: Colors.white))),
    );
  }
}

class Section4 extends StatelessWidget {
  const Section4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.only(top: 40),
        child: const Text(
          'Lorem ipsum',
          style: TextStyle(fontSize: 40),
        ));
  }
}

class ImageRender extends StatelessWidget {
  final String fileName;
  final EdgeInsets? margin;
  const ImageRender({Key? key, required this.fileName, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        child: Image(
          image: AssetImage('assets/$fileName'),
        ));
  }
}
