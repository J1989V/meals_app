import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/models/affordability.dart';

class Affordabilities with ChangeNotifier {
  List<Affordability> _items = [];

  List<Affordability> get items {
    return [..._items];
  }

  Affordability findById(int id) {
    return _items
        .firstWhere((affordability) => affordability.foodAffordabilityID == id);
  }

  Future<void> fetchAndSetAffordabilities() async {
    var url =
        Uri.parse('https://datafeed.custom-group.tech/api/FoodAffordabilities');
    try {
      final response = await http.get(
        url,
      );

      String arrayObjsText = response.body;
      var objsJson = jsonDecode(arrayObjsText) as List;
      List<Affordability> objs =
          objsJson.map((json) => Affordability.fromJson(json)).toList();

      _items = objs;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
