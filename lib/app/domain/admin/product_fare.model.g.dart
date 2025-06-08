// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_fare.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFareModel _$ProductFareModelFromJson(Map<String, dynamic> json) =>
    ProductFareModel(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      fareType: json['fare_type'] == null
          ? null
          : TypeModel.fromJson(json['fare_type'] as Map<String, dynamic>),
      fare: (json['fare'] as num?)?.toDouble(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductFareModelToJson(ProductFareModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'fare_type': instance.fareType,
      'fare': instance.fare,
      'status': instance.status,
    };
