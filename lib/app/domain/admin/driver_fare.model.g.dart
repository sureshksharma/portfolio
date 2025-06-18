// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_fare.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverFareModel _$DriverFareModelFromJson(Map<String, dynamic> json) =>
    DriverFareModel(
      id: (json['id'] as num?)?.toInt(),
      driver: json['driver'] == null
          ? null
          : DriverModel.fromJson(json['driver'] as Map<String, dynamic>),
      fareType: json['fare_type'] == null
          ? null
          : TypeModel.fromJson(json['fare_type'] as Map<String, dynamic>),
      fare: (json['fare'] as num?)?.toDouble(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DriverFareModelToJson(DriverFareModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver': instance.driver,
      'fare_type': instance.fareType,
      'fare': instance.fare,
      'status': instance.status,
    };
