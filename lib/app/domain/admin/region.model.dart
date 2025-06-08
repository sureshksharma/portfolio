import 'package:json_annotation/json_annotation.dart';

part 'region.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegionModel {
  int? id;
  String? title;
  int? country;
  int? status;

  RegionModel({
    this.id,
    this.title,
    this.country,
    this.status,
  });

  /// Helper methods for genericArgumentFactories
  static RegionModel fromJsonModel(Object? json) =>
      RegionModel.fromJson(json as Map<String, dynamic>);
  static Map<String, dynamic> toJsonModel(RegionModel order) => order.toJson();

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegionModelToJson(this);

  RegionModel copyWith({
    int? id,
    String? title,
    int? country,
    int? status,
  }) {
    return RegionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      country: country ?? this.country,
      status: status ?? this.status,
    );
  }
}
