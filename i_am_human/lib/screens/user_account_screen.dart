//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:i_am_human/utils/utils.dart';
import 'package:i_am_human/models/user.dart';
import 'package:i_am_human/data_access/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UserAccountScreenState();
  }
}

class UserAccountScreenState extends State<UserAccountScreen> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      return;
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  static final List<Widget> _widgetOptions = <Widget>[
    UserAccountMainWidget(),
    const Center(
      child: Text(
        'Data API',
      ),
    ),
    UserAccountSettingsWidget(),
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
  const UserAccountMainWidget({
    Key? key,
  }) : super(key: key);

  @override
  _UserAccountMainWidgetState createState() => _UserAccountMainWidgetState();
}

class _UserAccountMainWidgetState extends State<UserAccountMainWidget> {
  _UserAccountMainWidgetState();

  User user =
      User('null', 'null', 'null', 0, 0, 0, 'null', 'null', 'null', 'null');

  @override
  void initState() {
    getUser(user);
    super.initState();
  }

  Future getUser(User user) async {
    await OperationsWithData.getUserData(user);
    setState(() {});
    print('${user.name}' '${user.email}' '${user.password}' 'getUser');
  }

  Widget infoColumn(String headName, int name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          headName,
          style: AppTypography.font16S,
        ),
        Text(
          '$name',
          style: AppTypography.font16B,
        ),
      ],
    );
  }

  double _getImageFrameParametr(double width) {
    if (width < 300) {
      return width - 30;
    } else {
      return 270;
    }
  }

  @override
  Widget build(BuildContext context) {
    //getUser(user);
    OperationsWithData.getUserData(user);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
                      child: GestureDetector(
                        onTap: () => print('Add Image'),
                        child: Center(
                          child: Container(
                            height: _getImageFrameParametr(
                              screenWidth * 3 / 7,
                            ),
                            width: _getImageFrameParametr(
                              screenWidth * 3 / 7,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                _getImageFrameParametr(
                                  screenWidth * 3 / 14,
                                ),
                              ),
                              color: AppColors.whiteLight,
                            ),
                            child: const SizedBox(
                              height: 100,
                              width: 100,
                              child: Image(
                                image: AssetImage('assets/icon/addIcon.jpg'),
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
                          padding: const EdgeInsets.only(left: 10, right: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  user.name,
                                  // '',
                                  style: AppTypography.font20B,
                                ),
                              ),
                              Text(
                                user.email,
                                // '',
                                style: AppTypography.font14B,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: const Text(
                                  'Russia, Vladimir',
                                  style: AppTypography.font14B,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 10),
                                child: const Text(
                                  //user.slogan,
                                  '',
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
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: AppColors.whiteLight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(child: infoColumn('Age', 0)),
                    Flexible(child: infoColumn('Weight', 0)),
                    Flexible(child: infoColumn('Height', 0)),
                  ],
                ),
              ),
              Container(
                height: screenHeight - 400 - 56,
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

class UserAccountSettingsWidget extends StatefulWidget {
  const UserAccountSettingsWidget({Key? key}) : super(key: key);

  @override
  State<UserAccountSettingsWidget> createState() =>
      _UserAccountSettingsWidgetState();
}

class _UserAccountSettingsWidgetState extends State<UserAccountSettingsWidget> {
  final List<SettingElementData> commonSettings = [
    SettingElementData(Icons.language, 'Language'),
    SettingElementData(Icons.notifications_outlined, 'Notifications'),
    SettingElementData(Icons.style_outlined, 'Style'),
  ];

  final List<SettingElementData> privacySettings = [
    SettingElementData(Icons.privacy_tip, 'Privacy'),
    SettingElementData(Icons.storage, 'Data & Storage'),
    SettingElementData(Icons.contact_phone, 'Phone'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        width: 400,
        color: AppColors.whiteLight,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            SettingElementList(listElement: commonSettings),
            const SizedBox(
              height: 30,
            ),
            SettingElementList(listElement: privacySettings),
            const SizedBox(
              height: 30,
            ),
            const LogoutButton(),
          ],
        ),
      ),
    );
  }
}

class SettingElementData {
  SettingElementData(this.icon, this.text);
  final IconData icon;
  final String text;
}

class SettingElementList extends StatelessWidget {
  const SettingElementList({required this.listElement, Key? key})
      : super(key: key);
  final List<SettingElementData> listElement;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      color: AppColors.greenLight,
      child: Column(
        children:
            listElement.map((data) => SettingElement(data: data)).toList(),
      ),
    );
  }
}

class SettingElement extends StatelessWidget {
  const SettingElement({required this.data, Key? key}) : super(key: key);
  final SettingElementData data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: Icon(data.icon),
        ),
        Expanded(
          child: Text(
            data.text,
            style: AppTypography.font20B,
          ),
        ),
        const Icon(Icons.chevron_right_sharp),
      ],
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SupportPreferencesMethods.changeUserStatus;
        Navigator.of(context).pushReplacementNamed('/registration_screen');
      },
      child: Container(
        height: 80,
        width: 400,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.blackWithOpacity,
        ),
        child: const Text(
          'Logout',
          style: AppTypography.font20B,
        ),
      ),
    );
  }
}
