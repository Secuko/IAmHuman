import 'dart:async';

import 'package:i_am_human/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class _SharedPreferencesKeys {
  static const nameKey = 'name_key';
  static const emailKey = 'email_key';
  static const passwordKey = 'password_key';
  static const weightKey = 'weight_key';
  static const heightKey = 'height_key';
  static const ageKey = 'age_key';
  static const cityKey = 'city_key';
  static const countryKey = 'country_key';
  static const sloganKey = 'slogan_key';
  static const String dateKey = 'date_key';
  static const isLogin = 'is_Login';
  static const isLightTheme = 'is_light_theme';
}

class OperationsWithData {
  static final _storage = SharedPreferences.getInstance();

  static Future setUserData(User user) async {
    final storage = await _storage;
    await storage.setString(_SharedPreferencesKeys.nameKey, user.name);
    await storage.setString(_SharedPreferencesKeys.emailKey, user.email);
    await storage.setString(_SharedPreferencesKeys.passwordKey, user.password);
    await storage.setInt(_SharedPreferencesKeys.weightKey, user.weight);
    await storage.setInt(_SharedPreferencesKeys.heightKey, user.height);
    await storage.setInt(_SharedPreferencesKeys.ageKey, user.age);
    await storage.setString(_SharedPreferencesKeys.cityKey, user.city);
    await storage.setString(_SharedPreferencesKeys.countryKey, user.country);
    await storage.setString(_SharedPreferencesKeys.sloganKey, user.slogan);
    await storage.setString(_SharedPreferencesKeys.dateKey, user.date);
  }

  static Future getUserData(User user) async {
    final storage = await _storage;
    //final user = User(null, null, null, null, null, null, null, null, null, null);
    user 
    ..name = storage.getString(_SharedPreferencesKeys.nameKey)
    ..email = storage.getString(_SharedPreferencesKeys.emailKey)
    ..password = storage.getString(_SharedPreferencesKeys.passwordKey)
    ..weight = storage.getInt(_SharedPreferencesKeys.weightKey)
    ..height = storage.getInt(_SharedPreferencesKeys.heightKey)
    ..age = storage.getInt(_SharedPreferencesKeys.ageKey)
    ..city = storage.getString(_SharedPreferencesKeys.cityKey)
    ..country = storage.getString(_SharedPreferencesKeys.countryKey)
    ..slogan = storage.getString(_SharedPreferencesKeys.sloganKey)
    ..date = storage.getString(_SharedPreferencesKeys.dateKey);
    print(user.name + user.email + user.date);
    return user;
  }
}

class SupportPreferencesMethods{

  static Future<bool> getUserStatus() async{
    final  _storage = await SharedPreferences.getInstance();
    return _storage.getBool(_SharedPreferencesKeys.isLogin) ?? false;
  }

  static Future changeUserStatus() async{
    final  _storage = await SharedPreferences.getInstance();
    final currentStatus = !(_storage.getBool(_SharedPreferencesKeys.isLogin) ?? false);
    await _storage.setBool(_SharedPreferencesKeys.isLogin, currentStatus);
  }
  
  static Future<bool> getIsLightThemeStatus() async {
    final  _storage = await SharedPreferences.getInstance();
    return _storage.getBool(_SharedPreferencesKeys.isLightTheme) ?? false;
  } 

  static Future changeIsLightThemeStatus() async{
    final  _storage = await SharedPreferences.getInstance();
    final currentStatus = !(_storage.getBool(_SharedPreferencesKeys.isLightTheme) ?? false);
    await _storage.setBool(_SharedPreferencesKeys.isLightTheme, currentStatus);
  }
}
