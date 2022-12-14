import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'meal_instruction.dart';

class MealInstructions with ChangeNotifier {
  List<MealInstruction> _items = [];

  List<MealInstruction> get items {
    return [..._items];
  }

  Iterable<MealInstruction> findByMealId(int id) {
    return _items.where((mealInstruction) => mealInstruction.foodMealID == id);
  }

  Future<void> fetchAndSetMealInstructions() async {
    var url = Uri.parse(
        'https://datafeed.custom-group.tech/api/FoodMealInstructions');
    try {
      final response = await http.get(
        url,
      );

      String arrayObjsText = response.body;
      var objsJson = jsonDecode(arrayObjsText) as List;
      List<MealInstruction> objs =
          objsJson.map((json) => MealInstruction.fromJson(json)).toList();

      _items = objs;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
