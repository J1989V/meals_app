import 'package:flutter/material.dart';

import '../models/recipe.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            foodMealID: favoriteMeals[index].foodMealID,
            foodMealName: favoriteMeals[index].foodMealName,
            foodMealLogo: favoriteMeals[index].foodMealLogo,
            foodMealDescription: favoriteMeals[index].foodMealDescription,
            foodMealDuration: favoriteMeals[index].foodMealDuration,
            foodMealServings: favoriteMeals[index].foodMealServings,
            foodAffordabilityID: favoriteMeals[index].foodAffordabilityID,
            foodComplexityID: favoriteMeals[index].foodComplexityID,
            isGlutenFree: favoriteMeals[index].isGlutenFree,
            isLactoseFree: favoriteMeals[index].isLactoseFree,
            isVegan: favoriteMeals[index].isVegan,
            isVegetarian: favoriteMeals[index].isVegetarian,
            deleted: favoriteMeals[index].deleted,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
