import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../helpers/db_helper.dart';
import './meal.dart';

class Meals with ChangeNotifier {
  List<Meal> _items = [];

  List<Meal> get items {
    return [..._items];
  }

  Meal findById(int id) {
    return _items.firstWhere((meal) => meal.foodMealID == id);
  }

  //if internet connection exists
  Future<void> fetchMealsFromAPI() async {
    var url = Uri.parse('https://datafeed.custom-group.tech/api/FoodMeals');

    try {
      final response = await http.get(
        url,
      );

      String arrayObjsText = response.body;
      var objsJson = jsonDecode(arrayObjsText) as List;
      List<Meal> objs = objsJson.map((json) => Meal.fromJson(json)).toList();

      //loop deur data, if exists (fetchMealsFromDB) update, else insert
      //foreach meal in objs
      _items = objs;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  //if internet connection does not exist
  Future<void> fetchMealsFromDB() async {
    final dataList = await DBHelper.getData('meals');
    _items = dataList
        .map(
          (item) => Meal(
            foodMealID: item['FoodMealID'],
            foodMealName: item['FoodMealName'],
            foodMealLogo: item['FoodMealLogo'],
            foodMealDescription: item['FoodMealDescription'],
            foodMealDuration: item['FoodMealDuration'],
            foodMealServings: item['FoodMealServings'],
            foodAffordabilityID: item['FoodAffordabilityID'],
            foodComplexityID: item['FoodComplexityID'],
            isGlutenFree: item['isGlutenFree'],
            isLactoseFree: item['isLactoseFree'],
            isVegan: item['isVegan'],
            isVegetarian: item['isVegetarian'],
            deleted: item['Deleted'],
          ),
        )
        .toList();
    notifyListeners();
  }
}
