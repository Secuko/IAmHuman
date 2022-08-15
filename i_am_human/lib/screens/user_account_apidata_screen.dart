import 'package:flutter/material.dart';
import 'package:i_am_human/data_access/shared_preferences.dart';
import 'package:i_am_human/models/user.dart';
import 'package:i_am_human/models/weather_widget_model.dart';
import 'package:i_am_human/network/api_clients/api_clients.dart';
import 'package:i_am_human/network/entities/response.dart';
import 'package:i_am_human/utils/utils.dart';
import 'package:i_am_human/network/api_clients/responce_validation.dart';
import 'package:i_am_human/screens/user_account_settings_screen.dart';

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

  Widget backgroundWeatherWidget(String image) {
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
    return WeatherModelProvider(
      model: model,
      child: Container(
        color: AppColors.whiteLight,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            //backgroundWeatherWidget(weatherMap['sunny']!.image),
            ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: 300, maxHeight: screenHeight - 56, maxWidth: 400,),
              child: Container(
                margin: const EdgeInsets.only(top: 45),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.blackWithOpacity,
                ),
                child: InformingBodyWidget()
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InformingBodyWidget extends StatelessWidget {
  InformingBodyWidget({ Key? key }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    WeatherModelProvider.watch(context)?.model.reloadWeather();
    final weather = WeatherModelProvider.read(context)!.model.responce;
    return Column(
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
        ),
      ],
    );
  }
}