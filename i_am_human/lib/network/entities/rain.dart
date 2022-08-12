import 'package:json_annotation/json_annotation.dart';

part 'rain.g.dart';

@JsonSerializable()
class Rain {
  Rain({
    required this.oneHour,
    required this.threeHour,
  });
  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
  Map<String, dynamic> toJson() => _$RainToJson(this);
  @JsonKey(name: '1h')
  int oneHour;
  @JsonKey(name: '3h')
  int threeHour;
}
