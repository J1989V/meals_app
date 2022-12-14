import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class MealCategory {
  final int foodMealCategoryID;
  final int foodMealID;
  final int foodCategoryID;
  final int deleted;
  final Category category;

  const MealCategory({
    @required this.foodMealCategoryID,
    @required this.foodMealID,
    @required this.foodCategoryID,
    @required this.deleted,
    @required this.category,
  });

  factory MealCategory.fromJson(dynamic json) {
    return MealCategory(
      foodMealCategoryID: json['FoodMealCategoryID'],
      foodMealID: json['FoodMealID'],
      foodCategoryID: json['FoodCategoryID'],
      deleted: json['Deleted'],
      category: json['Category'],
    );
  }
}
