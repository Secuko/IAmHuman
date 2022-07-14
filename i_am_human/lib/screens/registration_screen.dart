import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';
import 'package:i_am_human/widgets/widgets.dart';

class RegisterWindow extends StatefulWidget {
  const RegisterWindow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new RegisterWindowState();
  }
}

class RegisterWindowState extends State<RegisterWindow> {
  Color getOpacity() {
    int _hour = (DateTime.now()).hour;
    if ((_hour >= 15) || (_hour < 3)) {
      return Color.fromRGBO(255, 255, 255, 0.4);
    } else
      return Color.fromRGBO(0, 0, 0, 0.1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          BackgroundImage(),
          Container(
            //margin: EdgeInsets.only(top: 160),
            margin: EdgeInsets.only(
                top: ((MediaQuery.of(context).size.height) / 6)),
            height: 305,
            width: 230,
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: getOpacity(),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputElem("Name"),
                InputElem("Login"),
                InputElem("Password"),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed('/login_screen'),
                  child: TextUnderInputField('Already have an account?'),
                ),
                BottomButton('Sign Up'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
