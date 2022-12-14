import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/models/complexity.dart';

import 'category.dart';

class Complexities with ChangeNotifier {
  List<Complexity> _items = [];

  List<Complexity> get items {
    return [..._items];
  }

  Complexity findById(int id) {
    return _items.firstWhere((complexity) => complexity.foodComplexityID == id);
  }

  Future<void> fetchAndSetComplexities() async {
    var url =
        Uri.parse('https://datafeed.custom-group.tech/api/FoodComplexities');
    try {
      final response = await http.get(
        url,
      );

      String arrayObjsText = response.body;
      var objsJson = jsonDecode(arrayObjsText) as List;
      List<Complexity> objs =
          objsJson.map((json) => Complexity.fromJson(json)).toList();

      _items = objs;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
