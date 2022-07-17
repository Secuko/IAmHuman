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
  int age = 18;
  int heigth = 180;
  int weight = 80;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget infoColumn(String headName, int name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Text(
            headName,
            style: AppTypography.font16S,
          ),
        ),
        Container(
          child: Text(
            "$name",
            style: AppTypography.font16B,
          ),
        ),
      ],
    );
  }

  double _getImageFrameParametr(double width){
    if (width < 300){
      return width - 30;
    } else 
    return 270;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            //width: double.infinity,
            color: AppColors.black,
            child: Column(
              children: <Widget>[
                Container(
                  //width: MediaQuery.of(context).size.width,
                  height: 300,
                  color: AppColors.greenWhite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Container(
                          //color: AppColors.white,
                          child: GestureDetector(
                            onTap: () => print('Add Image'),
                            child: Center(
                              child: Container(
                                height: _getImageFrameParametr(MediaQuery.of(context).size.width*3/7),
                                width: _getImageFrameParametr(MediaQuery.of(context).size.width*3/7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(_getImageFrameParametr(MediaQuery.of(context).size.width*3/7)/2),
                                  color: AppColors.whiteLight,
                                ),
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
                      ),
                      Flexible(
                        flex: 4,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  child: Text('$name  $surname',
                                      style: AppTypography.font20B),
                                ),
                                Container(
                                  child: Text('examplemail@gmail.com',
                                      style: AppTypography.font14B),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Vladimir, Russia',
                                      style: AppTypography.font14B,
                                    )),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    '"' +
                                        'Я Наруто Удзумаки! И да, кстати, я будущий хокаге.' +
                                        '"',
                                    style: AppTypography.font16B,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.whiteLight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(child: infoColumn("Age", age)),
                      Flexible(child: infoColumn("Weight", weight)),
                      Flexible(child: infoColumn("Height", heigth)),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 400 - 56,
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
