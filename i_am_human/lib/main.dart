//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';

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
            RegisterWindow(),
          ],
        ),
      ),
    );
  }
}

class RegisterWindow extends StatefulWidget {
  const RegisterWindow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new RegisterWindowState();
  }
}

class RegisterWindowState extends State<RegisterWindow> {
  double getOpacity() {
    int _hour = (DateTime.now()).hour;
    //int _hour = 2;
    if ((_hour >= 15) || (_hour < 3)) {
      return 0.5;
    } else
      return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 160),
      margin: EdgeInsets.only(top: ((MediaQuery.of(context).size.height) / 6)),
      height: 305,
      width: 230,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color.fromRGBO(255, 255, 255, getOpacity()),
      ),
      //color: Colors.white,
      alignment: FractionalOffset(0.5, 0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InputElem("Name"),
          InputElem("Login"),
          InputElem("Password"),
          GestureDetector(
            onTap: () => print(''),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Already have an account?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => print(''),
            child: bottomButton('Sign Up'),
          )
        ],
      ),
    );
  }

  Widget InputElem(String labelText) {
    bool isPassword = (labelText == "Password");
    return Container (
      margin: EdgeInsets.only(top: 5),
      child: TextField(
      maxLines: 1,
      obscureText: isPassword,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      style: AppTypography.font20,
    )
    );
  }

  Widget bottomButton(String str) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.black,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Colors.black45,
            Colors.white24,
          ],
        ),
      ),
      width: 192,
      height: 45,
      child: Center(
        child: Text(str, style: AppTypography.font26),
      ),
    );
  }
}

class LoginWindow extends StatefulWidget {
  const LoginWindow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new LoginWindowState();
  }
}

class LoginWindowState extends State<LoginWindow> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
