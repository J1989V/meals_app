import 'package:flutter/material.dart';
import 'package:meals_app/models/affordabilities.dart';
import 'package:meals_app/models/categories.dart';
import 'package:meals_app/models/meal_categories.dart';
import 'package:meals_app/models/meal_cookwares.dart';
import 'package:meals_app/models/meal_ingredients.dart';
import 'package:meals_app/models/meal_instructions.dart';
import 'package:meals_app/screens/loyalty_screen.dart';
import 'package:meals_app/screens/webview_screen.dart';
import 'package:meals_app/src/web_view_stack.dart';
import 'package:provider/provider.dart';

import 'models/complexities.dart';
import 'models/meal.dart';
import 'models/meals.dart';
import 'models/recipe.dart';
import 'models/recipes.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Meals()),
      ChangeNotifierProvider.value(
        value: Meals(),
      ),
      ChangeNotifierProvider(create: (context) => MealCategories()),
      ChangeNotifierProvider.value(
        value: MealCategories(),
      ),
      ChangeNotifierProvider(create: (context) => Categories()),
      ChangeNotifierProvider.value(
        value: Categories(),
      ),
      ChangeNotifierProvider(create: (context) => Recipes()),
      ChangeNotifierProvider.value(
        value: Recipes(),
      ),
      ChangeNotifierProvider(create: (context) => MealIngredients()),
      ChangeNotifierProvider.value(
        value: MealIngredients(),
      ),
      ChangeNotifierProvider(create: (context) => MealCookwares()),
      ChangeNotifierProvider.value(
        value: MealCookwares(),
      ),
      ChangeNotifierProvider(create: (context) => MealInstructions()),
      ChangeNotifierProvider.value(
        value: MealInstructions(),
      ),
      ChangeNotifierProvider(create: (context) => Complexities()),
      ChangeNotifierProvider.value(
        value: Complexities(),
      ),
      ChangeNotifierProvider(create: (context) => Affordabilities()),
      ChangeNotifierProvider.value(
        value: Affordabilities(),
      ),
    ], child: MyApp()));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _isInit = true;
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      Future.delayed(Duration.zero).then((_) {
        Provider.of<Recipes>(context).fetchAndSetRecipes(); //test this
      });
      super.initState();
    }

    // @override
    // void didChangeDependencies() {
    //   if (_isInit) {
    //     setState(() {
    //       _isLoading = true;
    //     });
    //     Provider.of<Recipes>(context).fetchAndSetRecipes().then((_) {
    //       setState(() {
    //         _isLoading = false;
    //       });
    //     });
    //   }
    //   _isInit = false;
    //   super.didChangeDependencies();
    // }

    Map<String, bool> _filters = {
      'gluten': false,
      'lactose': false,
      'vegan': false,
      'vegetarian': false,
    };

    List<Recipe> _availableMeals =
        Provider.of<Recipes>(context, listen: false).items;
    List<Recipe> _favoriteMeals = [];

    void _setFilters(Map<String, bool> filterData) {
      _filters = filterData;

      _availableMeals = Provider.of<Recipes>(context).items.where((meal) {
        if (_filters['gluten'] && meal.isGlutenFree == 0) {
          return false;
        }
        if (_filters['lactose'] && meal.isLactoseFree == 0) {
          return false;
        }
        if (_filters['vegan'] && meal.isVegan == 0) {
          return false;
        }
        if (_filters['vegetarian'] && meal.isVegetarian == 0) {
          return false;
        }
        return true;
      }).toList();
    }

    void _toggleFavorite(String mealId) {
      final existingIndex =
          _favoriteMeals.indexWhere((meal) => meal.foodMealID == mealId);
      if (existingIndex >= 0) {
        _favoriteMeals.removeAt(existingIndex);
      } else {
        _favoriteMeals.add(
          Provider.of<Recipes>(context)
              .items
              .firstWhere((meal) => meal.foodMealID == mealId),
        );
      }
    }

    bool _isMealFavorite(String id) {
      return _favoriteMeals.any((meal) => meal.foodMealID == id);
    }

    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),

      initialRoute: '/loyalty', // default is '/'
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        LoyaltyScreen.routeName: (ctx) => LoyaltyScreen(),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
        WebviewScreen.routeName: (ctx) => WebviewScreen(),
        WebViewStack.routeName: (ctx) => WebViewStack(),
      },
      // ignore: missing_return
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
