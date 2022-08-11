import 'package:json_annotation/json_annotation.dart';

part 'main.g.dart';

@JsonSerializable()
class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });
  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);
  double temp;
  @JsonKey(name: 'feels_like')
  double feelsLike;
  @JsonKey(name: 'temp_min')
  double tempMin;
  @JsonKey(name: 'temp_max')
  double tempMax;
  int pressure;
  int humidity;
}
