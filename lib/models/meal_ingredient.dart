import 'package:flutter/material.dart';

class MealIngredient {
  final int foodMealIngredientID;
  final int foodMealID;
  final String foodMealIngredient;
  final int deleted;

  const MealIngredient({
    @required this.foodMealIngredientID,
    @required this.foodMealID,
    @required this.foodMealIngredient,
    @required this.deleted,
  });

  factory MealIngredient.fromJson(dynamic json) {
    return MealIngredient(
      foodMealIngredientID: json['FoodMealIngredientID'],
      foodMealID: json['FoodMealID'],
      foodMealIngredient: json['FoodMealIngredient'],
      deleted: json['Deleted'],
    );
  }
}
