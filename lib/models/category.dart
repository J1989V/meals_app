import 'package:flutter/material.dart';

class Category with ChangeNotifier {
  final int foodCategoryID;
  final String foodCategoryName;
  final String foodCategoryLogo;
  final String foodDescription;
  final String foodColor;
  final int deleted;

  Category({
    @required this.foodCategoryID,
    @required this.foodCategoryName,
    @required this.foodCategoryLogo,
    @required this.foodDescription,
    @required this.foodColor,
    @required this.deleted,
  });

  factory Category.fromJson(dynamic json) {
    return Category(
      foodCategoryID: json['FoodCategoryID'],
      foodCategoryName: json['FoodCategoryName'],
      foodCategoryLogo: json['FoodCategoryLogo'],
      foodDescription: json['FoodDescription'],
      foodColor: json['FoodColor'],
      deleted: json['Deleted'],
    );
  }
}
