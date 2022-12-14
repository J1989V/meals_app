import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'category.dart';

class Categories with ChangeNotifier {
  List<Category> _items = [];

  List<Category> get items {
    return [..._items];
  }

  Category findById(int id) {
    return _items.firstWhere((category) => category.foodCategoryID == id);
  }

  Future<void> fetchAndSetCategories() async {
    var url =
        Uri.parse('https://datafeed.custom-group.tech/api/FoodCategories');
    try {
      final response = await http.get(
        url,
      );

      String arrayObjsText = response.body;
      var objsJson = jsonDecode(arrayObjsText) as List;
      List<Category> objs =
          objsJson.map((json) => Category.fromJson(json)).toList();

      _items = objs;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
