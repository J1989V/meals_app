import 'package:flutter/material.dart';

class MealInstruction {
  final int foodMealInstructionID;
  final int foodMealID;
  final int foodMealInstructionStep;
  final String foodMealInstructionDescription;
  final int foodMealInstructionDuration;
  final int foodMealInstructionMeanwhile;
  final int deleted;

  const MealInstruction({
    @required this.foodMealInstructionID,
    @required this.foodMealID,
    @required this.foodMealInstructionStep,
    @required this.foodMealInstructionDescription,
    @required this.foodMealInstructionDuration,
    @required this.foodMealInstructionMeanwhile,
    @required this.deleted,
  });

  factory MealInstruction.fromJson(dynamic json) {
    return MealInstruction(
      foodMealInstructionID: json['FoodMealInstructionID'],
      foodMealID: json['FoodMealID'],
      foodMealInstructionStep: json['FoodMealInstructionStep'],
      foodMealInstructionDescription: json['FoodMealInstructionDescription'],
      foodMealInstructionDuration: json['FoodMealInstructionDuration'],
      foodMealInstructionMeanwhile: json['FoodMealInstructionMeanwhile'],
      deleted: json['Deleted'],
    );
  }
}
