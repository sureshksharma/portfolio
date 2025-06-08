import 'package:json_annotation/json_annotation.dart';

part 'city.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CityModel {
  int? id;
  String? title;
  int? region;
  int? status;

  CityModel({
    this.id,
    this.title,
    this.region,
    this.status,
  });

  /// Helper methods for genericArgumentFactories
  static CityModel fromJsonModel(Object? json) =>
      CityModel.fromJson(json as Map<String, dynamic>);
  static Map<String, dynamic> toJsonModel(CityModel order) => order.toJson();

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  CityModel copyWith({
    int? id,
    String? title,
    int? region,
    int? status,
  }) {
    return CityModel(
      id: id ?? this.id,
      title: title ?? this.title,
      region: region ?? this.region,
      status: status ?? this.status,
    );
  }
}
