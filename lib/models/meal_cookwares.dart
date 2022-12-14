import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'meal_cookware.dart';

class MealCookwares with ChangeNotifier {
  List<MealCookware> _items = [];

  List<MealCookware> get items {
    return [..._items];
  }

  MealCookware findById(int id) {
    return _items.firstWhere((cookware) => cookware.foodMealCookwareID == id);
  }

  Future<void> fetchAndSetMealCookwares() async {
    var url =
        Uri.parse('https://datafeed.custom-group.tech/api/FoodMealCookwares');
    try {
      final response = await http.get(
        url,
      );

      String arrayObjsText = response.body;
      var objsJson = jsonDecode(arrayObjsText) as List;
      List<MealCookware> objs =
          objsJson.map((json) => MealCookware.fromJson(json)).toList();

      _items = objs;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
