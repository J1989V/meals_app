import 'package:flutter/material.dart';
import 'package:meals_app/models/affordability.dart';
import 'package:meals_app/models/complexity.dart';
import 'package:provider/provider.dart';

import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final int foodMealID;
  final String foodMealName;
  final String foodMealLogo;
  final String foodMealDescription;
  final int foodMealDuration;
  final int foodMealServings;
  final int foodAffordabilityID;
  final int foodComplexityID;
  final int isGlutenFree;
  final int isLactoseFree;
  final int isVegan;
  final int isVegetarian;
  final int deleted;

  MealItem({
    @required this.foodMealID,
    @required this.foodMealName,
    @required this.foodMealLogo,
    @required this.foodMealDescription,
    @required this.foodMealDuration,
    @required this.foodMealServings,
    @required this.foodAffordabilityID,
    @required this.foodComplexityID,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.deleted,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: foodMealID,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    foodMealLogo,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      foodMealName,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$foodMealDuration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(Provider.of<Complexity>(context, listen: false)
                          .foodComplexityName),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(Provider.of<Affordability>(context, listen: false)
                          .foodAffordabilityName),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
