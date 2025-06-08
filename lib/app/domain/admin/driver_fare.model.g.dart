// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_fare.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverFareModel _$DriverFareModelFromJson(Map<String, dynamic> json) =>
    DriverFareModel(
      id: (json['id'] as num?)?.toInt(),
      driverId: (json['driver_id'] as num?)?.toInt(),
      fareType: json['fare_type'] == null
          ? null
          : TypeModel.fromJson(json['fare_type'] as Map<String, dynamic>),
      fare: (json['fare'] as num?)?.toDouble(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DriverFareModelToJson(DriverFareModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver_id': instance.driverId,
      'fare_type': instance.fareType,
      'fare': instance.fare,
      'status': instance.status,
    };
