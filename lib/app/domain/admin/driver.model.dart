import 'package:json_annotation/json_annotation.dart';

part 'driver.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DriverModel {
  int? id;
  String? name;
  String? licenseNo;
  String? phone;
  String? email;
  int? status;
  String? createdAt;
  String? updatedAt;

  DriverModel({
    this.id,
    this.name,
    this.licenseNo,
    this.phone,
    this.email,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  /// Helper methods for genericArgumentFactories
  static DriverModel fromJsonModel(Object? json) =>
      DriverModel.fromJson(json as Map<String, dynamic>);
  static Map<String, dynamic> toJsonModel(DriverModel order) =>
      order.toJson();

  factory DriverModel.fromJson(Map<String, dynamic> json) =>
      _$DriverModelFromJson(json);

  Map<String, dynamic> toJson() => _$DriverModelToJson(this);

  DriverModel copyWith({
    int? id,
    String? name,
    String? licenseNo,
    String? phone,
    String? email,
    int? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return DriverModel(
      id: id ?? this.id,
      name: name ?? this.name,
      licenseNo: licenseNo ?? this.licenseNo,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
