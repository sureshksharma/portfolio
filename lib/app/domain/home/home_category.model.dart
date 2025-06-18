import 'package:json_annotation/json_annotation.dart';

import '../admin/product.model.dart';

part 'home_category.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HomeCategoryModel {
  int? id;
  String? name;
  List<ProductModel>? allProducts;

  HomeCategoryModel({
    this.id,
    this.name,
    this.allProducts,
  });

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCategoryModelToJson(this);

  HomeCategoryModel copyWith({
    int? id,
    String? name,
    List<ProductModel>? allProducts,
  }) {
    return HomeCategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      allProducts: allProducts ?? this.allProducts,
    );
  }
}
