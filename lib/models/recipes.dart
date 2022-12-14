import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

import '../helpers/db_helper.dart';
import 'recipe.dart';

class Recipes with ChangeNotifier {
  List<Recipe> _items = [];
  List<Recipe> _itemsByCategory = [];

  List<Recipe> get items {
    return [..._items];
  }

  List<Recipe> get itemsByCategory {
    return [..._itemsByCategory];
  }

  Recipe findById(int id) {
    return _items.firstWhere((recipe) => recipe.foodMealID == id);
  }

  Future<void> findByCategoryId(int id) async {
    var url = Uri.parse(
        'https://datafeed.custom-group.tech/api/FoodRecipes?CategoryID=${id}');

    try {
      final response = await http.get(
        url,
      );

      String arrayObjsText = response.body;
      var objsJson = jsonDecode(arrayObjsText) as List;
      List<Recipe> objs =
          objsJson.map((json) => Recipe.fromJson1(json)).toList();

      _itemsByCategory = objs;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchAndSetRecipes() async {
    var url = Uri.parse('https://datafeed.custom-group.tech/api/FoodRecipes');

    try {
      final response = await http.get(
        url,
      );

      String arrayObjsText = response.body;
      var objsJson = jsonDecode(arrayObjsText) as List;
      List<Recipe> objs =
          objsJson.map((json) => Recipe.fromJson1(json)).toList();

      _items = objs;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<List<Recipe>> recipes() async {
    // Get a reference to the database.
    final Database db = await DBHelper.database();

    // Query the table for all The Recipes.
    final List<Map<String, dynamic>> maps = await db.query('recipe');

    // Convert the List<Map<String, dynamic> into a List<Recipe>.
    return List.generate(
      maps.length,
      (i) {
        return Recipe(
          foodMealID: maps[i]['FoodMealID'],
          foodMealName: maps[i]['FoodMealName'],
          foodMealLogo: maps[i]['FoodMealLogo'],
          foodMealDescription: maps[i]['FoodMealDescription'],
          foodMealDuration: maps[i]['FoodMealDuration'],
          foodMealServings: maps[i]['FoodMealServings'],
          foodAffordabilityID: maps[i]['FoodAffordabilityID'],
          foodComplexityID: maps[i]['FoodComplexityID'],
          isGlutenFree: maps[i]['isGlutenFree'],
          isLactoseFree: maps[i]['isLactoseFree'],
          isVegan: maps[i]['isVegan'],
          isVegetarian: maps[i]['isVegetarian'],
          deleted: maps[i]['Deleted'],
          affordability: maps[i]['Affordability'],
          complexity: maps[i]['Complexity'],
          categories: maps[i]['Categories'],
          cookwares: maps[i]['Cookwares'],
          ingredients: maps[i]['Ingredients'],
          instructions: maps[i]['Instructions'],
        );
      },
    );
  }
}
