import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal_ingredients.dart';
import '../models/meal_instructions.dart';
import '../models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as int;
    // final selectedMeal = DUMMY_MEALS
    //     .firstWhere((meal) => meal.foodMealID == mealId);
    final selectedMeal = Provider.of<Meals>(
      context,
      listen: false,
    ).findById(mealId);
    final selectedMealIngredients =
        Provider.of<MealIngredients>(context, listen: false)
            .findByMealId(mealId);
    final selectedMealInstructions =
        Provider.of<MealInstructions>(context, listen: false)
            .findByMealId(mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.foodMealName}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                //change to get from DB
                selectedMeal.foodMealLogo,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child:
                        Text(selectedMealIngredients.first.foodMealIngredient),
                  ),
                  //itemCount: selectedMealIngredients.length,
                ),
              ),
            ),
            buildSectionTitle(context, 'Instructions'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMealInstructions
                            .first.foodMealInstructionDescription,
                      ),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMealInstructions.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
