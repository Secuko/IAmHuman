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
  double height = 250;
  bool detector = false;
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String _textError = ''; 
  bool _error = false;

  static Color getOpacity() {
    int _hour = (DateTime.now()).hour;
    if ((_hour >= 21) || (_hour < 3)) {
      return Color.fromRGBO(255, 255, 255, 0.4);
    } else
      return Color.fromRGBO(0, 0, 0, 0.4);
  }

  void _auth(){
    final String login = _loginTextController.text;
    final String password = _passwordTextController.text;
    print(login + password);
    if (login == 'admin' && password == 'admin'){
      Navigator.of(context).pushReplacementNamed('/user_account_Screen');
    } else {
      _error=true;
    _textError = 'error';
    setState(() {
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          BackgroundImage(),
          Container(
            margin: EdgeInsets.only(
                top: ((MediaQuery.of(context).size.height) / 6)),
            height: 230,
            width: 230,
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: getOpacity(),
            ),
            alignment: FractionalOffset(0.5, 0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (_error) errorTextWidget(_textError),
                InputElem("Login", _loginTextController),
                InputElem("Password",_passwordTextController),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed('/registration_screen'),
                  child: TextUnderInputField('Have no an account?'),
                ),
                GestureDetector(
                  onTap: _auth,
                  child: BottomButton('Sign In'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
