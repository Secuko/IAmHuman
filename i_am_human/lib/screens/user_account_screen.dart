import 'package:flutter/material.dart';
import 'package:i_am_human/data_access/shared_preferences.dart';
import 'package:i_am_human/models/user.dart';
import 'package:i_am_human/models/weather_widget_model.dart';
import 'package:i_am_human/network/api_clients/api_clients.dart';
import 'package:i_am_human/network/entities/response.dart';
import 'package:i_am_human/utils/utils.dart';
import 'package:i_am_human/network/api_clients/responce_validation.dart';

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

  Widget _textUponMenu(String text) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 50),
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Text(
        text,
        style: AppTypography.font20B,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: 400, minHeight: screenHeight - 56),
        child: Container(
          color: AppColors.whiteLight,
          child: Column(
            children: [
              Container(
                color: AppColors.green,
                padding: const EdgeInsets.only(top: 30, bottom: 15),
                child: const UserProfileImage(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  children: <Widget>[
                    _textUponMenu('Common Settings'),
                    SettingElementList(listElement: commonSettings),
                    const SizedBox(
                      height: 30,
                    ),
                    _textUponMenu('Privacy Settings'),
                    SettingElementList(listElement: privacySettings),
                    const SizedBox(
                      height: 30,
                    ),
                    const AppThemeSettingWidget(),
                    const SizedBox(
                      height: 30,
                    ),
                    const LogoutButton(),
                  ],
                ),
              ),
            ],
          ),
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
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.whiteGrey,
      ),
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
    return GestureDetector(
      onTap: () => print(data.text),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: Icon(data.icon),
            ),
            Expanded(
              child: Text(
                data.text,
                style: AppTypography.font20,
              ),
            ),
            const Icon(Icons.chevron_right_sharp),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SupportPreferencesMethods.changeUserStatus();
        Navigator.of(context).pushReplacementNamed('/');
      },
      child: Container(
        height: 80,
        width: 400,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.blackGrey,
        ),
        child: const Text(
          'Logout',
          style: AppTypography.font20B,
        ),
      ),
    );
  }
}

class AppThemeSettingWidget extends StatefulWidget {
  const AppThemeSettingWidget({Key? key}) : super(key: key);

  @override
  State<AppThemeSettingWidget> createState() => _AppThemeSettingWidgetState();
}

class _AppThemeSettingWidgetState extends State<AppThemeSettingWidget> {
  late bool appThemeIsLight = false;

  @override
  void initState() {
    super.initState();
    getCurrentTheme();
  }

  Future getCurrentTheme() async {
    appThemeIsLight = await SupportPreferencesMethods.getIsLightThemeStatus();
    setState(
      () {},
    );
  }

  Future _changeTheme(bool value) async {
    setState(
      () {
        appThemeIsLight = value;
        print(appThemeIsLight);
      },
    );
    await SupportPreferencesMethods.changeIsLightThemeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: const Icon(Icons.dark_mode),
        ),
        const Expanded(
          child: Text(
            'Application theme',
            style: AppTypography.font20,
          ),
        ),
        Switch(
          value: appThemeIsLight,
          activeColor: AppColors.green,
          activeTrackColor: AppColors.greenLight,
          onChanged: _changeTheme,
        ),
      ],
    );
  }
}

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({Key? key}) : super(key: key);
  double _getImageFrameParametr(double width) {
    if (width < 300) {
      return width - 30;
    } else {
      return 270;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
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
                screenWidth * 4 / 14,
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
    );
  }
}

class SupportWeatherImageIconsClass {
  SupportWeatherImageIconsClass(this.icon, this.image);
  final IconData icon;
  final String image;
}

class SupportWeatherParametrClass {
  SupportWeatherParametrClass(this.name, this.icon, this.parametr, this.units);
  final String name;
  final IconData icon;
  final double parametr;
  final String units;
}

class WeatherDataWidget extends StatefulWidget {
  const WeatherDataWidget({Key? key}) : super(key: key);

  @override
  State<WeatherDataWidget> createState() => _WeatherDataWidgetState();
}

class _WeatherDataWidgetState extends State<WeatherDataWidget> {
  final model = WeatherWidgetModel();
  final Map<String, SupportWeatherImageIconsClass> weatherMap = {
    'sunny': SupportWeatherImageIconsClass(
      Icons.wb_sunny,
      'assets/weather/sunny.jpg',
    ),
    'snowy': SupportWeatherImageIconsClass(
      Icons.cloudy_snowing,
      'assets/weather/frosty.jpg',
    ),
    'cloudy': SupportWeatherImageIconsClass(
      Icons.cloud,
      'assets/weather/cloudy.jpg',
    ),
    'rainy': SupportWeatherImageIconsClass(
      Icons.water_drop,
      'assets/weather/rainy.jpg',
    ),
    'low_cloudy': SupportWeatherImageIconsClass(
      Icons.cloud_outlined,
      'assets/weather/low_cloudy.jpg',
    )
  };

  final List<SupportWeatherParametrClass> weatherParametrsList = [
    SupportWeatherParametrClass(
      'Feels like',
      Icons.plus_one,
      25,
      '°C',
    ),
    SupportWeatherParametrClass(
      'Humidity',
      Icons.water_drop_outlined,
      73,
      '%',
    ),
    SupportWeatherParametrClass(
      'Pressure',
      Icons.timer_outlined,
      755,
      ' мм.рт.ст.',
    ),
    SupportWeatherParametrClass(
      'Wind speed',
      Icons.water_outlined,
      15.4,
      ' м/с',
    ),
  ];

  Widget headerWeatherWidget(String image) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 56,
      width: MediaQuery.of(context).size.width,
      child: FittedBox(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.hardEdge,
        fit: (MediaQuery.of(context).size.width <
                MediaQuery.of(context).size.height)
            ? BoxFit.cover
            : BoxFit.contain,
        child: Image(
          image: AssetImage(image),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    //ApiClient().getResponce();
    final screenHeight = MediaQuery.of(context).size.height;
    WeatherModelProvider.read(context)?.model.reloadWeather();
    final weather = WeatherModelProvider.read(context)!.model.responce;
    return WeatherModelProvider(
      model: model,
      child: Container(
        color: AppColors.whiteLight,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            headerWeatherWidget(weatherMap['sunny']!.image),
            ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: 300, maxHeight: screenHeight - 56, maxWidth: 400),
              child: Container(
                margin: const EdgeInsets.only(top: 45),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.blackWithOpacity,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWeatherWidget(
                        icon: weatherMap[
                                ResponceValidation.getCurrentWeatherStatus(
                                    weather)]!
                            .icon),
                    Column(
                      children: weatherParametrsList
                          .map((data) => WeatherParametr(data: data))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherParametr extends StatelessWidget {
  const WeatherParametr({required this.data, Key? key}) : super(key: key);
  final SupportWeatherParametrClass data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
      color: AppColors.blackWithOpacity,
      child: Row(
        children: [
          Icon(
            data.icon,
            size: 35,
            color: AppColors.white,
          ),
          Container(
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              '${data.name}: ${data.parametr}${data.units}',
              style: AppTypography.font22w,
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderWeatherWidget extends StatelessWidget {
  const HeaderWeatherWidget({required this.icon, Key? key}) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final weather = WeatherModelProvider.read(context)!.model.responce;

    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Container(
          width: 140,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Icon(
            icon,
            size: 120,
            color: AppColors.white,
          ),
        ),
        Container(
          height: 140,
          width: 160,
          alignment: Alignment.center,
          child: Text(
            ResponceValidation.tempToString(weather),
            style: AppTypography.font50,
          ),
        )
      ],
    );
  }
}
