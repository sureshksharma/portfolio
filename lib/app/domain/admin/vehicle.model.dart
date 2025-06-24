import 'package:json_annotation/json_annotation.dart';

import 'type.model.dart';
import 'vehicle_fare.model.dart';

part 'vehicle.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VehicleModel {
  int? id;
  String? make;
  String? model;
  int? year;
  TypeModel? type;
  List<VehicleFareModel>? fare;
  int? capacity;
  String? licensePlate;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  VehicleModel({
    this.id,
    this.make,
    this.model,
    this.year,
    this.type,
    this.fare,
    this.capacity,
    this.licensePlate,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  /// Helper methods for genericArgumentFactories
  static VehicleModel fromJsonModel(Object? json) =>
      VehicleModel.fromJson(json as Map<String, dynamic>);
  static Map<String, dynamic> toJsonModel(VehicleModel order) => order.toJson();

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);

  VehicleModel copyWith({
    int? id,
    String? make,
    String? model,
    int? year,
    TypeModel? type,
    List<VehicleFareModel>? fare,
    int? capacity,
    String? licensePlate,
    String? image,
    int? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return VehicleModel(
      id: id ?? this.id,
      make: make ?? this.make,
      model: model ?? this.model,
      year: year ?? this.year,
      type: type ?? this.type,
      fare: fare ?? this.fare,
      capacity: capacity ?? this.capacity,
      licensePlate: licensePlate ?? this.licensePlate,
      image: image ?? this.image,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
