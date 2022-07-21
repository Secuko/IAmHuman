import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';
import 'package:i_am_human/widgets/widgets.dart';
import 'package:i_am_human/screens/login_screen.dart';

class RegisterWindow extends StatefulWidget {
  const RegisterWindow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new RegisterWindowState();
  }
}



class RegisterWindowState extends State<RegisterWindow> {
  final _nameTextController = TextEditingController();
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String _textError = ''; 
  bool _error = false;

  void _createAccount(){
    final String name = _nameTextController.text;
    final String login = _loginTextController.text;
    final String password = _passwordTextController.text;
    print(name + login + password);
    _error=true;
    _textError = 'error';
    setState(() {
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
            height: 280,
            width: 230,
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: LoginWindowState.getOpacity(),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround, 
              children: [
                if (_error) errorTextWidget(_textError),
                InputElem("Name",_nameTextController),
                InputElem("Login",_loginTextController),
                InputElem("Password",_passwordTextController),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed('/login_screen'),
                  child: TextUnderInputField('Already have an account?'),
                ),
                GestureDetector(
                  onTap: _createAccount,
                  child: BottomButton('Sign Un'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
