import 'package:flutter/material.dart';
import 'package:i_am_human/utils/colors.dart';
import 'package:i_am_human/widgets/widgets.dart';

class LoginWindow extends StatefulWidget {
  const LoginWindow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginWindowState();
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
    final _hour = DateTime.now().hour;
    if ((_hour >= 21) || (_hour < 3)) {
      return AppColors.whiteWithOpacity;
    } else {
      return AppColors.blackWithOpacity;
    }
  }

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    //print(login + password);
    if (login == 'admin@gmail.com' && password == 'admin') {
      Navigator.of(context).pushReplacementNamed('/user_account_Screen');
    } else {
      _error = true;
      _textError = 'error';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          BackgroundImage(),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight / 6,
            ),
            height: 230,
            width: 230,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: getOpacity(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (_error) ErrorTextWidget(_textError),
                InputElem('E-mail', _loginTextController),
                InputElem('Password', _passwordTextController),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed('/registration_screen'),
                  child: const TextUnderInputField('Have no an account?'),
                ),
                GestureDetector(
                  onTap: _auth,
                  child: const BottomButton('Sign In'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
