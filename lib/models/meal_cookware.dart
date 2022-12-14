import 'package:flutter/material.dart';

class MealCookware {
  final int foodMealCookwareID;
  final int foodMealID;
  final String foodMealCookware;
  final int deleted;

  const MealCookware({
    @required this.foodMealCookwareID,
    @required this.foodMealID,
    @required this.foodMealCookware,
    @required this.deleted,
  });

  factory MealCookware.fromJson(dynamic json) {
    return MealCookware(
      foodMealCookwareID: json['FoodMealCookwareID'],
      foodMealID: json['FoodMealID'],
      foodMealCookware: json['FoodMealCookware'],
      deleted: json['Deleted'],
    );
  }
}
