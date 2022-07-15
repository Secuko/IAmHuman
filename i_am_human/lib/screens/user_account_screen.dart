import 'dart:html';

import 'package:flutter/material.dart';
import 'package:i_am_human/screens/home_screen.dart';
import 'package:i_am_human/utils/utils.dart';
import 'package:i_am_human/widgets/widgets.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new UserAccountScreenState();
  }
}

class UserAccountScreenState extends State<UserAccountScreen> {
  String name = "Artem";
  String surname = "Silaev";
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: double.infinity,
            color: AppColors.black,
            child: Column(
              children: <Widget>[
                Container(
                  //width: MediaQuery.of(context).size.width,
                  height: 300,
                  color: AppColors.greenWhite,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          //color: AppColors.white,
                          child: Center(
                            child: GestureDetector(
                              onTap: () => print('Add Image'),
                              child: Container(
                                height: 100,
                                width: 100,
                                //color: AppColors.white,
                                child: Image(
                                  image: AssetImage('icon/addIcon.jpg'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                //color: AppColors.white,
                                child: Text('$name  $surname',
                                    style: AppTypography.font20B),
                              ),
                              Container(
                                //color: AppColors.white,
                                child: Text('examplemail@gmail.com',
                                    style: AppTypography.font14B),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Vladimir, Russia',
                                  style: AppTypography.font14B,
                                )
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  '"' + 'Я Наруто Удзумаки! И да, кстати, я будущий хокаге.' + '"',
                                  style: AppTypography.font16B,
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.blue,
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "Age",
                                style: AppTypography.font16B,
                              ),
                            ),
                            Container(
                              child: Text(
                                "18",
                                style: AppTypography.font16B,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "weight",
                                style: AppTypography.font16B,
                              ),
                            ),
                            Container(
                              child: Text(
                                "75",
                                style: AppTypography.font16B,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "Height",
                                style: AppTypography.font16B,
                              ),
                            ),
                            Container(
                              child: Text(
                                "180",
                                style: AppTypography.font16B,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 200,
                  width: double.infinity,
                  color: AppColors.whiteLight,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: AppColors.greenWhite,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Data API',
            backgroundColor: AppColors.greenLight,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: AppColors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
