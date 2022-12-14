import 'package:flutter/material.dart';
import 'package:meals_app/models/categories.dart';
import 'package:provider/provider.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final int foodCategoryID;
  final String foodCategoryName;
  final String foodCategoryLogo;
  final String foodDescription;
  final String foodColor;
  final int deleted;

  CategoryItem(
    this.foodCategoryID,
    this.foodCategoryName,
    this.foodCategoryLogo,
    this.foodDescription,
    this.foodColor,
    this.deleted,
  );

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'categoryId': foodCategoryID,
        'categoryName': foodCategoryName,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            foodCategoryName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                (Provider.of<Categories>(context).fromHex(foodColor))
                    .withOpacity(0.7),
                Provider.of<Categories>(context).fromHex(foodColor),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
