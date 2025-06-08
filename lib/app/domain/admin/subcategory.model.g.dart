// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubcategoryModel _$SubcategoryModelFromJson(Map<String, dynamic> json) =>
    SubcategoryModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      desc: json['desc'] as String?,
      products: (json['products'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$SubcategoryModelToJson(SubcategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'desc': instance.desc,
      'products': instance.products,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
