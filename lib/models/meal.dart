import 'package:flutter/foundation.dart';

class Meal {
  final int foodMealID;
  final String foodMealName;
  final String foodMealLogo;
  final String foodMealDescription;
  final int foodMealDuration;
  final int foodMealServings;
  final int foodAffordabilityID;
  final int foodComplexityID;
  final int isGlutenFree;
  final int isLactoseFree;
  final int isVegan;
  final int isVegetarian;
  final int deleted;

  const Meal({
    @required this.foodMealID,
    @required this.foodMealName,
    @required this.foodMealLogo,
    @required this.foodMealDescription,
    @required this.foodMealDuration,
    @required this.foodMealServings,
    @required this.foodAffordabilityID,
    @required this.foodComplexityID,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.deleted,
  });

  factory Meal.fromJson(dynamic json) {
    return Meal(
      foodMealID: json['FoodMealID'],
      foodMealName: json['FoodMealName'],
      foodMealLogo: json['FoodMealLogo'],
      foodMealDescription: json['FoodMealDescription'],
      foodMealDuration: json['FoodMealDuration'],
      foodMealServings: json['FoodMealServings'],
      foodAffordabilityID: json['FoodAffordabilityID'],
      foodComplexityID: json['FoodComplexityID'],
      isGlutenFree: json['isGlutenFree'],
      isLactoseFree: json['isLactoseFree'],
      isVegan: json['isVegan'],
      isVegetarian: json['isVegetarian'],
      deleted: json['Deleted'],
    );
  }
}
