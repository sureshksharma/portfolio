// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverModel _$DriverModelFromJson(Map<String, dynamic> json) => DriverModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      licenseNo: json['license_no'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DriverModelToJson(DriverModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'license_no': instance.licenseNo,
      'phone': instance.phone,
      'email': instance.email,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
