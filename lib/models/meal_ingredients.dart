import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'meal_ingredient.dart';

class MealIngredients with ChangeNotifier {
  List<MealIngredient> _items = [];

  List<MealIngredient> get items {
    return [..._items];
  }

  Iterable<MealIngredient> findByMealId(int id) {
    return _items.where((mealIngredient) => mealIngredient.foodMealID == id);
  }

  Future<void> fetchAndSetMealIngredients() async {
    var url =
        Uri.parse('https://datafeed.custom-group.tech/api/FoodMealIngredients');
    try {
      final response = await http.get(
        url,
      );

      String arrayObjsText = response.body;
      var objsJson = jsonDecode(arrayObjsText) as List;
      List<MealIngredient> objs =
          objsJson.map((json) => MealIngredient.fromJson(json)).toList();

      _items = objs;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
