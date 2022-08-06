//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i_am_human/l10n/l10n.dart';
import 'package:i_am_human/screens/home_screen.dart';
import 'package:i_am_human/screens/login_screen.dart';
import 'package:i_am_human/screens/registration_screen.dart';
import 'package:i_am_human/screens/user_account_screen.dart';
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
      routes: {
        '/': (context) => const Home(),
        '/registration_screen': (context) => const RegisterWindow(),
        '/login_screen': (context) => const LoginWindow(),
        '/user_account_screen': (context) => const UserAccountScreen(),
      },
      theme: ThemeData(
        fontFamily: 'RobotoSlab',
        scaffoldBackgroundColor: AppColors.white,
      ),
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('Navigation error'),
              ),
            );
          },
        );
      },
    );
  }
}
