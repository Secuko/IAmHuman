//import 'dart:html';

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
  // String name = "Artem";
  // final String _surname = "Silaev";
  // final int _age = 18;
  // final int _heigth = 180;
  // final int _weight = 80;
  // final String _slogan = "Я Наруто Удзумаки! И да, кстати, я будущий хокаге.";
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    UserAccountMainWidget(
        name: "Artem",
        surname: "Silaev",
        age: 18,
        heigth: 180,
        weight: 80,
        slogan: "Я Наруто Удзумаки! И да, кстати, я будущий хокаге."),
    Center(
      child: Text(
        'Data API',
      )
    ),
    Center(
      child: Text(
        'Settings',
      )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
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
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class UserAccountMainWidget extends StatefulWidget {
  String? name = '';
  String? surname = '';
  int? age = 0;
  int? heigth = 0;
  int? weight = 0;
  String? slogan = '';
  UserAccountMainWidget(
      {Key? key,
      this.name,
      this.surname,
      this.age,
      this.heigth,
      this.weight,
      this.slogan})
      : super(key: key);

  @override
  _UserAccountMainWidgetState createState() => _UserAccountMainWidgetState(
      name, 
      this.surname, 
      this.age, 
      this.heigth, 
      this.weight, 
      this.slogan);
}

class _UserAccountMainWidgetState extends State<UserAccountMainWidget> {
  String? name = '';
  String? surname = '';
  int? age = 0;
  int? heigth = 0;
  int? weight = 0;
  String? slogan = '';
  _UserAccountMainWidgetState(
      this.name, this.surname, this.age, this.heigth, this.weight, this.slogan);

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

  double _getImageFrameParametr(double width) {
    if (width < 300) {
      return width - 30;
    } else
      return 270;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          color: AppColors.black,
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                color: AppColors.greenWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: Container(
                        child: GestureDetector(
                          onTap: () => print('Add Image'),
                          child: Center(
                            child: Container(
                              height: _getImageFrameParametr(
                                MediaQuery.of(context).size.width * 3 / 7,
                              ),
                              width: _getImageFrameParametr(
                                MediaQuery.of(context).size.width * 3 / 7,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  _getImageFrameParametr(
                                    MediaQuery.of(context).size.width * 3 / 14,
                                  ),
                                ),
                                color: AppColors.whiteLight,
                              ),
                              child: Container(
                                height: 100,
                                width: 100,
                                child: const Image(
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
                                  slogan!,
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
                    Flexible(child: infoColumn('Age', age!)),
                    Flexible(child: infoColumn('Weight', weight!)),
                    Flexible(child: infoColumn('Height', heigth!)),
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
    );
  }
}
