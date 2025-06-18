import 'package:json_annotation/json_annotation.dart';

import 'driver.model.dart';
import 'type.model.dart';

part 'driver_fare.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DriverFareModel {
  int? id;
  DriverModel? driver;
  TypeModel? fareType;
  double? fare;
  int? status;

  DriverFareModel({
    this.id,
    this.driver,
    this.fareType,
    this.fare,
    this.status,
  });

  /// Helper methods for genericArgumentFactories
  static DriverFareModel fromJsonModel(Object? json) =>
      DriverFareModel.fromJson(json as Map<String, dynamic>);
  static Map<String, dynamic> toJsonModel(DriverFareModel order) =>
      order.toJson();

  factory DriverFareModel.fromJson(Map<String, dynamic> json) =>
      _$DriverFareModelFromJson(json);

  Map<String, dynamic> toJson() => _$DriverFareModelToJson(this);

  DriverFareModel copyWith({
    int? id,
    DriverModel? driver,
    TypeModel? fareType,
    double? fare,
    int? status,
  }) {
    return DriverFareModel(
      id: id ?? this.id,
      driver: driver ?? this.driver,
      fareType: fareType ?? this.fareType,
      fare: fare ?? this.fare,
      status: status ?? this.status,
    );
  }
}
