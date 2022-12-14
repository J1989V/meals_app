import 'package:flutter/material.dart';
import 'package:meals_app/models/recipes.dart';
import 'package:provider/provider.dart';

import '../models/recipe.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Recipe> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryName;
  List<Recipe> displayedMeals = [];
  List<Recipe> recipeCategories;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
      categoryName = routeArgs['categoryName'];
      final categoryId = routeArgs['categoryId'];

      Provider.of<Recipes>(context, listen: false)
          .findByCategoryId(categoryId)
          .then((value) => recipeCategories =
              (Provider.of<Recipes>(context, listen: false).itemsByCategory))
          .then((value) => displayedMeals =
                  Provider.of<Recipes>(context, listen: false)
                      .items
                      .where((recipe) {
                return recipe.categories.contains(categoryId);
              }).toList());

      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // ignore: unused_element
  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.foodMealID == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            foodMealID: displayedMeals[index].foodMealID,
            foodMealName: displayedMeals[index].foodMealName,
            foodMealLogo: displayedMeals[index].foodMealLogo,
            foodMealDescription: displayedMeals[index].foodMealDescription,
            foodMealDuration: displayedMeals[index].foodMealDuration,
            foodMealServings: displayedMeals[index].foodMealServings,
            foodAffordabilityID: displayedMeals[index].foodAffordabilityID,
            foodComplexityID: displayedMeals[index].foodComplexityID,
            isGlutenFree: displayedMeals[index].isGlutenFree,
            isLactoseFree: displayedMeals[index].isLactoseFree,
            isVegan: displayedMeals[index].isVegan,
            isVegetarian: displayedMeals[index].isVegetarian,
            deleted: displayedMeals[index].deleted,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
