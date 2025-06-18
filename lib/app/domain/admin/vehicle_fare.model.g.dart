// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_fare.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleFareModel _$VehicleFareModelFromJson(Map<String, dynamic> json) =>
    VehicleFareModel(
      id: (json['id'] as num?)?.toInt(),
      vehicle: json['vehicle'] == null
          ? null
          : VehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
      fareType: json['fare_type'] == null
          ? null
          : TypeModel.fromJson(json['fare_type'] as Map<String, dynamic>),
      fare: (json['fare'] as num?)?.toDouble(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VehicleFareModelToJson(VehicleFareModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicle': instance.vehicle,
      'fare_type': instance.fareType,
      'fare': instance.fare,
      'status': instance.status,
    };
