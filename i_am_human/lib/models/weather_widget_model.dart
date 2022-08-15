import 'package:flutter/material.dart';
import 'package:i_am_human/network/api_clients/api_clients.dart';
import 'package:i_am_human/network/entities/response.dart';

class WeatherWidgetModel extends ChangeNotifier {
  late Responce _responce;
  final apiClient = ApiClient();
  Responce get responce => _responce;

  Future<void> reloadWeather() async {
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
