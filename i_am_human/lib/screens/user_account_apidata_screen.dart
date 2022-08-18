import 'package:flutter/material.dart';
import 'package:i_am_human/models/weather_widget_model.dart';
import 'package:i_am_human/network/api_clients/responce_validation.dart';
import 'package:i_am_human/utils/utils.dart';

class WeatherDataWidget extends StatefulWidget {
  const WeatherDataWidget({Key? key}) : super(key: key);

  @override
  State<WeatherDataWidget> createState() => _WeatherDataWidgetState();
}

class _WeatherDataWidgetState extends State<WeatherDataWidget> {
  final model = WeatherWidgetModel();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return WeatherModelProvider(
      model: model,
      child: Container(
        color: AppColors.whiteLight,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            const _BackgroundWeatherWidget(),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 300,
                maxHeight: screenHeight - 56,
                maxWidth: 400,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 45),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.blackWithOpacity,
                ),
                child: const InformingBodyWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundWeatherWidget extends StatelessWidget {
  const _BackgroundWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModelProvider.read(context)?.model.reloadWeather();
    final weather = WeatherModelProvider.read(context)!.model.responce;
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
          image: AssetImage(
            ResponceValidation.getCurrentWeatherImageString(weather),
          ),
        ),
      ),
    );
  }
}

class InformingBodyWidget extends StatelessWidget {
  const InformingBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weather = WeatherModelProvider.watch(context)!.model.responce;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderWeatherWidget(
          icon: ResponceValidation.getCurrentWeatherIcon(weather),
        ),
        Column(
          children: ResponceValidation.parametrsList(weather)
              .map((data) => WeatherParametrWidget(data: data))
              .toList(),
        ),
      ],
    );
  }
}

class WeatherParametrWidget extends StatelessWidget {
  const WeatherParametrWidget({required this.data, Key? key}) : super(key: key);
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
    final weather = WeatherModelProvider.watch(context)!.model.responce;

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
            '${ResponceValidation.tempToString(weather)}°C',
            style: AppTypography.font50,
          ),
        ),
      ],
    );
  }
}
