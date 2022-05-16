import "package:flutter/material.dart";
import 'package:my_app/utils/theme_colors.dart';

String username = "isaacismaelx14";

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          TopAccount(),
          Configurations(),
        ],
      ),
    );
  }
}

class TopAccount extends StatelessWidget {
  const TopAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      alignment: Alignment.topCenter,
      child: const UserInformation(),
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(50), // Image radius
                child: const Image(
                  image: AssetImage('assets/avatar.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                username,
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ],
        ));
  }
}

class Configurations extends StatelessWidget {
  const Configurations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color.fromARGB(20, 0, 0, 0),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ButtonsConfig(
                    text: "Followers",
                    fullWidth: false,
                    hideTopBar: true,
                  ),
                  ButtonsConfig(
                    text: "Following",
                    fullWidth: false,
                    hideTopBar: true,
                  ),
                ],
              ),
            ),
            const ButtonsConfig(
              text: "Account settings",
            ),
            const ButtonsConfig(
              text: "Log out",
              last: true,
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonsConfig extends StatelessWidget {
  final String text;
  final bool? last;
  final Color? textColor;
  final bool? fullWidth;
  final bool? hideTopBar;

  const ButtonsConfig({
    Key? key,
    required this.text,
    this.last,
    this.textColor,
    this.fullWidth,
    this.hideTopBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: const Color.fromARGB(20, 0, 0, 0),
            style: hideTopBar == true ? BorderStyle.none : BorderStyle.solid,
            width: 1.0,
          ),
          bottom: BorderSide(
            color: const Color.fromARGB(20, 0, 0, 0),
            style: last == null ? BorderStyle.none : BorderStyle.solid,
            width: 1.0,
          ),
        ),
      ),
      child: Column(
        children: [
          TextButton(
            style: fullWidth == false
                ? null
                : TextButton.styleFrom(
                    minimumSize: Size(
                      (MediaQuery.of(context).size.width),
                      60,
                    ),
                  ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: textColor ?? primaryColor,
              ),
            ),
            onPressed: () {
              print(text);
            },
          )
        ],
      ),
    );
  }
}
