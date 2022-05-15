import "package:flutter/material.dart";

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 30),
            color: Colors.white,
            child: Text('Settings'))
      ],
    );
  }
}
