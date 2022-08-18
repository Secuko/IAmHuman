import 'package:i_am_human/network/api_clients/api_clients.dart';
import 'package:i_am_human/network/entities/response.dart';
import 'package:flutter/material.dart';

class ResponceValidation{
  static void changeResponceFormatData(Responce responce){
    responce.main.temp = ( responce.main.temp - 273.15).roundToDouble(); 
    responce.main.feelsLike =  (responce.main.feelsLike - 273.15).roundToDouble();
    responce.main.pressure = (responce.main.pressure/1.333).round(); 
  }

  static String getCurrentWeatherStatus(Responce responce){
    //final responce = await ApiClient().getResponce();
    if(responce.rain!=null && responce.rain!.oneHour>0){
      return 'rainy';
    } else if(responce.snow!=null && responce.snow!.oneHour>0){
      return 'snowy';
    } else if(responce.clouds.all>75){
      return 'sunny';
    } else if(responce.clouds.all>50){
      return 'low_cloudy';
    } else {
      return 'cloudy';
    }
  }

  static String getCurrentWeatherImageString(Responce responce){
    return weatherMap[getCurrentWeatherStatus(responce)]!.image;
  }

  static IconData getCurrentWeatherIcon(Responce responce){
    return weatherMap[getCurrentWeatherStatus(responce)]!.icon;
  }

  static String tempToString(Responce responce, [bool isFeelsLike = false]){
    final parametr = isFeelsLike ? responce.main.feelsLike : responce.main.temp; 
    final str = (parametr>0) ? '+' : '-';
    return str + parametr.toInt().toString();
  }

  static List<SupportWeatherParametrClass> parametrsList(Responce responce){
    return [
    SupportWeatherParametrClass(
      'Feels like',
      Icons.plus_one,
      tempToString(responce, true),
      '°C',
    ),
    SupportWeatherParametrClass(
      'Humidity',
      Icons.water_drop_outlined,
      responce.main.humidity.toString(),
      '%',
    ),
    SupportWeatherParametrClass(
      'Pressure',
      Icons.timer_outlined,
      responce.main.pressure.toString(),
      ' мм.рт.ст.',
    ),
    SupportWeatherParametrClass(
      'Wind speed',
      Icons.water_outlined,
      responce.wind.speed.toString(),
      ' м/с',
    ),
  ];
  }

  static final Map<String, SupportWeatherImageIconsClass> weatherMap = {
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
}

class SupportWeatherParametrClass {
  SupportWeatherParametrClass(this.name, this.icon, this.parametr, this.units);
  final String name;
  final IconData icon;
  final String parametr;
  final String units;
}

class SupportWeatherImageIconsClass {
  SupportWeatherImageIconsClass(this.icon, this.image);
  final IconData icon;
  final String image;
}
