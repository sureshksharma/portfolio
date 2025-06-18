// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_category.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeCategoryModel _$HomeCategoryModelFromJson(Map<String, dynamic> json) =>
    HomeCategoryModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      allProducts: (json['all_products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeCategoryModelToJson(HomeCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'all_products': instance.allProducts,
    };
