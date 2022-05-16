import "package:flutter/material.dart";

String username = "isaacismaelx14";

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TopAccount(),
        Configurations(),
      ],
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const UserInformation(),
          TextButton(
            child: const Text('Log out',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              print('Log out');
            },
          ),
        ],
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(25), // Image radius
            child: const Image(
              image: AssetImage('assets/avatar.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Text(
            username,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class Configurations extends StatelessWidget {
  const Configurations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: const [
          ButtonsConfig(
            text: "Friends",
          ),
          ButtonsConfig(
            text: "Followers",
          ),
          ButtonsConfig(
            text: "Following",
          ),
          ButtonsConfig(
            text: "Account settings",
          ),
        ],
      ),
    );
  }
}

class ButtonsConfig extends StatelessWidget {
  final String text;

  const ButtonsConfig({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        child: Column(children: [
          TextButton(
            child: Text(
              text,
              style: const TextStyle(fontSize: 20),
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
