import 'package:flutter/material.dart';
import 'package:i_am_human/data_access/shared_preferences.dart';
import 'package:i_am_human/models/user.dart';
import 'package:i_am_human/screens/login_screen.dart';
import 'package:i_am_human/widgets/widgets.dart';

class RegisterWindow extends StatefulWidget {
  const RegisterWindow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterWindowState();
  }
}

class RegisterWindowState extends State<RegisterWindow> {
  final _nameTextController = TextEditingController();
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String _textError = ''; 
  bool _error = false;

  Future _createAccount() async {
    final name = _nameTextController.text;
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    final now = DateTime.now();
    final convertedDateTime = "${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}";
    final user = User(name, login, password, 0, 0, 0, '', '', '', convertedDateTime);
    await OperationsWithData.setUserData(user);
    await SupportPreferencesMethods.changeUserStatus();
    final userStatus = await SupportPreferencesMethods.getUserStatus();
    //print('${user.name}' '${user.email}'  '${user.password}' '$userStatus');
    Navigator.of(context).pushReplacementNamed('/user_account_screen');
  }

  String? errorValidator(){
    return 'Error';
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
                top: screenHeight / 6,),
            height: 280,
            width: 230,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: LoginWindowState.getOpacity(),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround, 
              children: [
                if (_error) ErrorTextWidget(_textError),
                InputElem('Name',_nameTextController),
                InputElem('E-mail',_loginTextController),
                InputElem('Password',_passwordTextController),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed('/login_screen'),
                  child: const TextUnderInputField('Already have an account?'),
                ),
                GestureDetector(
                  onTap: _createAccount,
                  child: const BottomButton('Register'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
