import 'package:flutter/material.dart';
import 'package:i_am_human/screens/home_screen.dart';
import 'package:i_am_human/utils/utils.dart';
import 'package:i_am_human/widgets/widgets.dart';
import 'package:i_am_human/screens/registration_screen.dart';

class LoginWindow extends StatefulWidget {
  const LoginWindow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new LoginWindowState();
  }
}

class LoginWindowState extends State<LoginWindow> {
  //double marginTop =(MediaQuery.of(context).size.height) / 6;
  double height = 250;
  bool detector = false;

  Color getOpacity() {
    int _hour = (DateTime.now()).hour;
    if ((_hour >= 15) || (_hour < 3)) {
      return Color.fromRGBO(255, 255, 255, 0.4);
    } else
      return Color.fromRGBO(0, 0, 0, 0.1);
  }

  void _ChangeState() {
    setState(() {
      detector = !detector;
    });
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
            height: (detector) ? 350 : 250,
            width: 230,
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: getOpacity(),
            ),
            //color: Colors.white,
            alignment: FractionalOffset(0.5, 0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InputElem("Login"),
                InputElem("Password"),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed('/registration_screen'),
                  child: TextUnderInputField('Have no an account?'),
                ),
                BottomButton('Sign In'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
