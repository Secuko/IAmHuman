import 'package:i_am_human/network/entities/clowds.dart';
import 'package:i_am_human/network/entities/coord.dart';
import 'package:i_am_human/network/entities/main.dart';
import 'package:i_am_human/network/entities/sys.dart';
import 'package:i_am_human/network/entities/weather.dart';
import 'package:i_am_human/network/entities/wind.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable() 
class Responce {
  Responce({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clowds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory Responce.fromJson(Map<String,dynamic> json) => _$ResponceFromJson(json);
  Map<String,dynamic> toJson() => _$ResponceToJson(this);

  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clowds clowds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;
}
//flutter pub run build_runner watch