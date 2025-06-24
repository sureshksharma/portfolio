// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      id: (json['id'] as num?)?.toInt(),
      make: json['make'] as String?,
      model: json['model'] as String?,
      year: (json['year'] as num?)?.toInt(),
      type: json['type'] == null
          ? null
          : TypeModel.fromJson(json['type'] as Map<String, dynamic>),
      fare: (json['fare'] as List<dynamic>?)
          ?.map((e) => VehicleFareModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      capacity: (json['capacity'] as num?)?.toInt(),
      licensePlate: json['license_plate'] as String?,
      image: json['image'] as String?,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'make': instance.make,
      'model': instance.model,
      'year': instance.year,
      'type': instance.type,
      'fare': instance.fare,
      'capacity': instance.capacity,
      'license_plate': instance.licensePlate,
      'image': instance.image,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
