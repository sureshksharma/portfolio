import 'package:json_annotation/json_annotation.dart';

import 'type.model.dart';

part 'product_fare.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductFareModel {
  int? id;
  int? productId;
  TypeModel? fareType;
  double? fare;
  int? status;

  ProductFareModel({
    this.id,
    this.productId,
    this.fareType,
    this.fare,
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
    int? productId,
    TypeModel? fareType,
    double? fare,
    int? status,
  }) {
    return ProductFareModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      fareType: fareType ?? this.fareType,
      fare: fare ?? this.fare,
      status: status ?? this.status,
    );
  }
}
