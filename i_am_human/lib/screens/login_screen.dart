import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';
import 'package:i_am_human/widgets/widgets.dart';

class LoginWindow extends StatefulWidget {
  const LoginWindow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new LoginWindowState();
  }
}

class LoginWindowState extends State<LoginWindow> {
  Color getOpacity() {
    int _hour = (DateTime.now()).hour;
    if ((_hour >= 15) || (_hour < 3)) {
      return Color.fromRGBO(255, 255, 255, 0.4);
    } else
      return Color.fromRGBO(0, 0, 0, 0.1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 160),
      margin: EdgeInsets.only(top: ((MediaQuery.of(context).size.height) / 6)),
      height: 250,
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
          TextUnderInputField('Have no an account?'),
          BottomButton('Sign Up'),
        ],
      ),
    );
    ;
  }
}
