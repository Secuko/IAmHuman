import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';
import 'package:i_am_human/screens/registration_screen.dart';
import 'package:i_am_human/screens/login_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  Widget _getBackgroundImage() {
    final now = DateTime.now();
    int _hours = now.hour;
    //int _hours = 2;
    String imageName = "";
    if ((_hours >= 3) && (_hours < 9)) {
      imageName = "backgroundMorning";
    } else if ((_hours >= 9) && (_hours < 15)) {
      imageName = "backgroundDay";
    } else if ((_hours >= 15) && (_hours < 21)) {
      imageName = "backgroundEvening";
    } else {
      imageName = "backgroundNight";
    }
    return Image(
      image: AssetImage('assets/background/' + imageName + '.jpg'),
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.blue,
              child: _getBackgroundImage(),
            ),
            LoginWindow(),
          ],
        ),
      ),
    );
  }
}