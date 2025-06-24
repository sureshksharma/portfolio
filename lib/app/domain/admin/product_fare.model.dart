import 'package:json_annotation/json_annotation.dart';

import 'product.model.dart';
import 'type.model.dart';
import 'vehicle.model.dart';

part 'product_fare.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductFareModel {
  int? id;
  ProductModel? product;
  int? duration;
  String? durationType;
  VehicleModel? vehicle;
  TypeModel? fareType;
  double? baseFare;
  double? finalFare;
  int? status;

  ProductFareModel({
    this.id,
    this.product,
    this.duration,
    this.durationType,
    this.vehicle,
    this.fareType,
    this.baseFare,
    this.finalFare,
    this.status,
  });

  /// Helper methods for genericArgumentFactories
  static ProductFareModel fromJsonModel(Object? json) =>
      ProductFareModel.fromJson(json as Map<String, dynamic>);
  static Map<String, dynamic> toJsonModel(ProductFareModel order) =>
      order.toJson();

  factory ProductFareModel.fromJson(Map<String, dynamic> json) =>
      _$ProductFareModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductFareModelToJson(this);

  ProductFareModel copyWith({
    int? id,
    ProductModel? product,
    int? duration,
    String? durationType,
    VehicleModel? vehicle,
    TypeModel? fareType,
    double? baseFare,
    double? finalFare,
    int? status,
  }) {
    return ProductFareModel(
      id: id ?? this.id,
      product: product ?? this.product,
      duration: duration ?? this.duration,
      durationType: durationType ?? this.durationType,
      vehicle: vehicle ?? this.vehicle,
      fareType: fareType ?? this.fareType,
      baseFare: baseFare ?? this.baseFare,
      finalFare: finalFare ?? this.finalFare,
      status: status ?? this.status,
    );
  }
}
