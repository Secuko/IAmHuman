//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:i_am_human/screens/login_screen.dart';
import 'package:i_am_human/screens/registration_screen.dart';
import 'package:i_am_human/utils/utils.dart';
import 'package:i_am_human/screens/home_screen.dart';
import 'package:i_am_human/screens/user_account_screen.dart';

void main() {
  runApp(const HumanAppStart());
}

class HumanAppStart extends StatelessWidget {
  const HumanAppStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IAmHuman',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        '/registration_screen': (context) => RegisterWindow(),
        '/login_screen': (context) => LoginWindow(),
        '/user_account_Screen':(context) => UserAccountScreen(),
      },
      theme: ThemeData(
        fontFamily: 'RobotoSlab',
        scaffoldBackgroundColor: AppColors.white,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text('Navigation error'),
            ),
          );
        });
      },
    );
  }
}
