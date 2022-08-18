import 'package:flutter/material.dart';
import 'package:i_am_human/data_access/shared_preferences.dart';
import 'package:i_am_human/models/user.dart';
import 'package:i_am_human/screens/user_account_apidata_screen.dart';
import 'package:i_am_human/screens/user_account_settings_screen.dart';
import 'package:i_am_human/utils/utils.dart';
import 'package:i_am_human/widgets/widgets.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UserAccountScreenState();
  }
}

class UserAccountScreenState extends State<UserAccountScreen> {
  int _selectedIndex = 1;
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
    const UserAccountMainWidget(),
    const WeatherDataWidget(),
    const UserAccountSettingsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
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

  User user = User('null', 'null', 'null', 0, 0, 0, 'null', 'null', 'null', 'null');

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

  @override
  Widget build(BuildContext context) {
    //getUser(user);
    OperationsWithData.getUserData(user);
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
                    const Flexible(
                      flex: 3,
                      child: UserProfileImage(),
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
