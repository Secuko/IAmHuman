import 'package:flutter/material.dart';
import 'package:i_am_human/data_access/shared_preferences.dart';
import 'package:i_am_human/screens/user_account_screen.dart';
import 'package:i_am_human/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  StatefulWidget window =  const UserAccountScreen();

  @override
  void initState() {
    super.initState();
    getCurrentScreen();
  }

  void getCurrentScreen() async {
    final variable = await SupportPreferencesMethods.getUserStatus();
    //print('$variable' + 'getCurrentScreen');
    //variable = false;
    //print(variable);
    if (variable){
      await Navigator.of(context).pushReplacementNamed('/user_account_screen');
    } else {
      await Navigator.of(context).pushReplacementNamed('/registration_screen');
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            BackgroundImage(),
          ],
        ),
      ),
    );
  }
}
