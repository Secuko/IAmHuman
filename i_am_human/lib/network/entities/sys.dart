import 'package:json_annotation/json_annotation.dart';

part 'sys.g.dart';

@JsonSerializable()
class Sys {
  Sys({
    // required this.type,
    // required this.id,
    // required this.message,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
  Map<String, dynamic> toJson() => _$SysToJson(this);
  // int type;
  // int id;
  // double message;
  String country;
  int sunrise;
  int sunset;
}
