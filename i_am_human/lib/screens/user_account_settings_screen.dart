import 'package:flutter/material.dart';
import 'package:i_am_human/data_access/shared_preferences.dart';
import 'package:i_am_human/utils/utils.dart';
import 'package:i_am_human/widgets/widgets.dart';

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

