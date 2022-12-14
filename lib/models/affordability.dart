import 'package:flutter/material.dart';

class Affordability {
  final int foodAffordabilityID;
  final String foodAffordabilityName;
  final String foodAffordabilityLogo;
  final String foodAffordabilityDescription;
  final int deleted;

  const Affordability({
    @required this.foodAffordabilityID,
    @required this.foodAffordabilityName,
    @required this.foodAffordabilityLogo,
    @required this.foodAffordabilityDescription,
    @required this.deleted,
  });

  factory Affordability.fromJson(dynamic json) {
    return Affordability(
      foodAffordabilityID: json['FoodAffordabilityID'],
      foodAffordabilityName: json['FoodAffordabilityName'],
      foodAffordabilityLogo: json['FoodAffordabilityLogo'],
      foodAffordabilityDescription: json['FoodAffordabilityDescription'],
      deleted: json['Deleted'],
    );
  }
}
