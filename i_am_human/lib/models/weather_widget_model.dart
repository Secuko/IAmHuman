import 'package:flutter/material.dart';
import 'package:i_am_human/network/api_clients/api_clients.dart';
import 'package:i_am_human/network/entities/clowds.dart';
import 'package:i_am_human/network/entities/coord.dart';
import 'package:i_am_human/network/entities/main.dart';
import 'package:i_am_human/network/entities/rain.dart';
import 'package:i_am_human/network/entities/response.dart';
import 'package:i_am_human/network/entities/snow.dart';
import 'package:i_am_human/network/entities/sys.dart';
import 'package:i_am_human/network/entities/weather.dart';
import 'package:i_am_human/network/entities/wind.dart';

class WeatherWidgetModel extends ChangeNotifier {
  Responce _responce = Responce(
    coord: Coord(lon: 0, lat: 0),
    weather: [],
    base: 'empty',
    main: Main(
      temp: 0,
      feelsLike: 0,
      tempMin: 0,
      tempMax: 0,
      pressure: 0,
      humidity: 0,
    ),
    visibility: 0,
    wind: Wind(speed: 0, deg: 0),
    clouds: Clouds(all: 0),
    rain: Rain(oneHour: 0, threeHour: 0),
    snow: Snow(oneHour: 0, threeHour: 0),
    dt: 0,
    sys: Sys(country: 'Russia', sunrise: 0, sunset: 0),
    timezone: 1,
    id: 1111111,
    name: 'Empty',
    cod: 0,
  );

  final apiClient = ApiClient();
  Responce get responce => _responce;

  Future<void> reloadWeather() async {
    print('reloadWeather');
    _responce = await apiClient.getResponce();
    notifyListeners();
  }
}

class WeatherModelProvider extends InheritedNotifier {
  const WeatherModelProvider({
    required this.model,
    required Widget child,
    Key? key,
  }) : super(key: key, notifier: model, child: child);
  final WeatherWidgetModel model;

  static WeatherModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WeatherModelProvider>();
  }

  static WeatherModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<WeatherModelProvider>()
        ?.widget;
    return widget is WeatherModelProvider ? widget : null;
  }
}
