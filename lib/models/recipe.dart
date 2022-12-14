import 'package:flutter/foundation.dart';
import 'package:meals_app/models/affordability.dart';
import 'package:meals_app/models/category.dart' as Category;
import 'package:meals_app/models/complexity.dart';

import 'meal_cookware.dart';
import 'meal_ingredient.dart';
import 'meal_instruction.dart';

class Recipe {
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
  final dynamic affordability;
  final dynamic complexity;
  final dynamic categories;
  final dynamic cookwares;
  final dynamic ingredients;
  final dynamic instructions;

  const Recipe({
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
    @required this.affordability,
    @required this.complexity,
    @required this.categories,
    @required this.cookwares,
    @required this.ingredients,
    @required this.instructions,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
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
      affordability: json['Affordability'],
      complexity: json['Complexity'],
      categories: json['Categories'],
      cookwares: json['Cookwares'],
      ingredients: json['Ingredients'],
      instructions: json['Instructions'],
    );
  }

  factory Recipe.fromJson1(dynamic data) {
    final foodMealID = data['FoodMealID'];
    final foodMealName = data['FoodMealName'];
    final foodMealLogo = data['FoodMealLogo'];
    final foodMealDescription = data['FoodMealDescription'];
    final foodMealDuration = data['FoodMealDuration'];
    final foodMealServings = data['FoodMealServings'];
    final foodAffordabilityID = data['FoodAffordabilityID'];
    final foodComplexityID = data['FoodComplexityID'];
    final isGlutenFree = data['isGlutenFree'];
    final isLactoseFree = data['isLactoseFree'];
    final isVegan = data['isVegan'];
    final isVegetarian = data['isVegetarian'];
    final deleted = data['Deleted'];
    final affordabilityData = data['Affordability'];
    final affordability = affordabilityData != null
        ? affordabilityData
            .map((affordabilityData) =>
                Affordability.fromJson(affordabilityData))
            .toList()
        : <Affordability>[];
    final complexityData = data['Complexity'];
    final complexity = complexityData != null
        ? complexityData
            .map((complexityData) => Complexity.fromJson(complexityData))
            .toList()
        : <Complexity>[];
    final categoriesData = data['Categories'];
    final categories = categoriesData != null
        ? categoriesData
            .map((categoriesData) => Category.Category.fromJson(categoriesData))
            .toList()
        : <Category.Category>[];
    final cookwaresData = data['Cookwares'];
    final cookwares = cookwaresData != null
        ? cookwaresData
            .map((cookwaresData) => MealCookware.fromJson(cookwaresData))
            .toList()
        : <MealCookware>[];
    final ingredientsData = data['Ingredients'];
    final ingredients = ingredientsData != null
        ? ingredientsData
            .map((ingredientsData) => MealIngredient.fromJson(ingredientsData))
            .toList()
        : <MealIngredient>[];
    final instructionsData = data['Instructions'];
    final instructions = instructionsData != null
        ? instructionsData
            .map((instructionsData) =>
                MealInstruction.fromJson(instructionsData))
            .toList()
        : <MealInstruction>[];
    return Recipe(
      foodMealID: foodMealID,
      foodMealName: foodMealName,
      foodMealLogo: foodMealLogo,
      foodMealDescription: foodMealDescription,
      foodMealDuration: foodMealDuration,
      foodMealServings: foodMealServings,
      foodAffordabilityID: foodAffordabilityID,
      foodComplexityID: foodComplexityID,
      isGlutenFree: isGlutenFree,
      isLactoseFree: isLactoseFree,
      isVegan: isVegan,
      isVegetarian: isVegetarian,
      deleted: deleted,
      affordability: affordability,
      complexity: complexity,
      categories: categories,
      cookwares: cookwares,
      ingredients: ingredients,
      instructions: instructions,
    );
  }
}
