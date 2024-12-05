

import 'package:ecombloc/features/home/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity{
  CategoryModel({required super.title});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'],
    );
  }
}