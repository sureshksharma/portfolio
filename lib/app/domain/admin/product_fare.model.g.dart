// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_fare.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFareModel _$ProductFareModelFromJson(Map<String, dynamic> json) =>
    ProductFareModel(
      id: (json['id'] as num?)?.toInt(),
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      duration: (json['duration'] as num?)?.toInt(),
      durationType: json['duration_type'] as String?,
      vehicle: json['vehicle'] == null
          ? null
          : VehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
      fareType: json['fare_type'] == null
          ? null
          : TypeModel.fromJson(json['fare_type'] as Map<String, dynamic>),
      baseFare: (json['base_fare'] as num?)?.toDouble(),
      finalFare: (json['final_fare'] as num?)?.toDouble(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductFareModelToJson(ProductFareModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'duration': instance.duration,
      'duration_type': instance.durationType,
      'vehicle': instance.vehicle,
      'fare_type': instance.fareType,
      'base_fare': instance.baseFare,
      'final_fare': instance.finalFare,
      'status': instance.status,
    };
