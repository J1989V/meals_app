import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'meal_category.dart';

class MealCategories with ChangeNotifier {
  List<MealCategory> _items = [];

  List<MealCategory> get items {
    return [..._items];
  }

  Iterable<MealCategory> findByCategoryId(int id) {
    return _items.where((mealcategory) => mealcategory.foodCategoryID == id);
  }

  Future<void> fetchAndSetMealCategories() async {
    var url =
        Uri.parse('https://datafeed.custom-group.tech/api/FoodMealCategories');
    try {
      final response = await http.get(
        url,
      );

      String arrayObjsText = response.body;
      var objsJson = jsonDecode(arrayObjsText) as List;
      List<MealCategory> objs =
          objsJson.map((json) => MealCategory.fromJson(json)).toList();

      _items = objs;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
