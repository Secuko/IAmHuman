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
          TextUnderInputField('Already have an account?'),
          BottomButton('Sign Up'),
        ],
      ),
    );
  }
}