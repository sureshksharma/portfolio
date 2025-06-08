import 'package:json_annotation/json_annotation.dart';

import 'type.model.dart';

part 'vehicle_fare.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VehicleFareModel {
  int? id;
  int? vehicleId;
  TypeModel? fareType;
  double? fare;
  int? status;

  VehicleFareModel({
    this.id,
    this.vehicleId,
    this.fareType,
    this.fare,
    this.status,
  });

  /// Helper methods for genericArgumentFactories
  static VehicleFareModel fromJsonModel(Object? json) =>
      VehicleFareModel.fromJson(json as Map<String, dynamic>);
  static Map<String, dynamic> toJsonModel(VehicleFareModel order) =>
      order.toJson();

  factory VehicleFareModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleFareModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleFareModelToJson(this);

  VehicleFareModel copyWith({
    int? id,
    int? vehicleId,
    TypeModel? fareType,
    double? fare,
    int? status,
  }) {
    return VehicleFareModel(
      id: id ?? this.id,
      vehicleId: vehicleId ?? this.vehicleId,
      fareType: fareType ?? this.fareType,
      fare: fare ?? this.fare,
      status: status ?? this.status,
    );
  }
}
