import 'package:flutter/material.dart';

class Complexity {
  final int foodComplexityID;
  final String foodComplexityName;
  final String foodComplexityLogo;
  final String foodComplexityDescription;
  final int deleted;

  const Complexity({
    @required this.foodComplexityID,
    @required this.foodComplexityName,
    @required this.foodComplexityLogo,
    @required this.foodComplexityDescription,
    @required this.deleted,
  });

  factory Complexity.fromJson(dynamic json) {
    return Complexity(
      foodComplexityID: json['FoodComplexityID'],
      foodComplexityName: json['FoodComplexityName'],
      foodComplexityLogo: json['FoodComplexityLogo'],
      foodComplexityDescription: json['FoodComplexityDescription'],
      deleted: json['Deleted'],
    );
  }
}
