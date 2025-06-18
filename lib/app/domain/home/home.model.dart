import 'package:json_annotation/json_annotation.dart';

import 'home_category.model.dart';

part 'home.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HomeModel {
  List<String>? sliders;
  List<HomeCategoryModel>? categories;

  HomeModel({
    this.sliders,
    this.categories,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);

  HomeModel copyWith({
    List<String>? sliders,
    List<HomeCategoryModel>? categories,
  }) {
    return HomeModel(
      sliders: sliders ?? this.sliders,
      categories: categories ?? this.categories,
    );
  }
}
