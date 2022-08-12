import 'package:json_annotation/json_annotation.dart';

part 'snow.g.dart';

@JsonSerializable()
class Snow {
  Snow({
    required this.oneHour,
    required this.threeHour,
  });
  factory Snow.fromJson(Map<String, dynamic> json) => _$SnowFromJson(json);
  Map<String, dynamic> toJson() => _$SnowToJson(this);
  @JsonKey(name: '1h')
  int oneHour;
  @JsonKey(name: '3h')
  int threeHour;
}
