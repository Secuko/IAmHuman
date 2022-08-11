import 'package:json_annotation/json_annotation.dart';

part 'clowds.g.dart';

@JsonSerializable()
class Clowds {
  Clowds({
    required this.all,
  });
  factory Clowds.fromJson(Map<String, dynamic> json) => _$ClowdsFromJson(json);
  Map<String, dynamic> toJson() => _$ClowdsToJson(this);
  int all;
}
