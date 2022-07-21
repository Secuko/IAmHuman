import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';
import 'package:i_am_human/screens/registration_screen.dart';
import 'package:i_am_human/screens/login_screen.dart';
import 'package:i_am_human/screens/user_account_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  StatefulWidget window = RegisterWindow();

  void ChangeHomeStatus(StatefulWidget window) {
    setState(() {
      this.window = window;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            //UserAccountScreen(),
            window,
          ],
        ),
      ),
    );
  }
}
