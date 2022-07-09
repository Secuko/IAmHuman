//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';
import 'package:i_am_human/screens/home_screen.dart';

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
      theme: ThemeData(
        fontFamily: 'RobotoSlab',
      ),
      home: Home(),
    );
  }
}