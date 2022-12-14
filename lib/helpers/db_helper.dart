import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'recipes.db'),
        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE foodMeals(foodMealID INTEGER PRIMARY KEY, foodMealName TEXT, foodMealLogo TEXT, foodMealDescription TEXT, foodMealDuration INTEGER, foodMealServings INTEGER, foodAffordabilityID INTEGER, foodComplexityID INTEGER, isGlutenFree INTEGER, isLactoseFree INTEGER, isVegan INTEGER, isVegetarian INTEGER, deleted INTEGER,)');
      db.execute(
          'CREATE TABLE foodAffordabilities(foodAffordabilityID INTEGER, foodAffordabilityName TEXT, foodAffordabilityLogo TEXT, foodAffordabilityDescription TEXT, deleted INTEGER,)');
      db.execute(
          'CREATE TABLE foodCategories(foodCategoryID INTEGER, foodCategoryName TEXT, foodCategoryLogo TEXT, foodDescription TEXT, foodColor TEXT, deleted INTEGER,)');
      db.execute(
          'CREATE TABLE foodComplexities(foodComplexityID INTEGER, foodComplexityName TEXT, foodComplexityLogo TEXT, foodComplexityDescription TEXT, deleted INTEGER,)');
      db.execute(
          'CREATE TABLE foodMealCategories(foodMealCategoryID INTEGER, foodMealID INTEGER, foodCategoryID INTEGER, deleted INTEGER,)');
      db.execute(
          'CREATE TABLE foodMealCookwares(foodMealCookwareID INTEGER, foodMealID INTEGER, foodMealCookware TEXT, deleted INTEGER,)');
      db.execute(
          'CREATE TABLE foodMealIngredients(foodMealIngredientID INTEGER, foodMealID INTEGER, foodMealIngredient TEXT, deleted INTEGER,)');
      db.execute(
          'CREATE TABLE foodMealInstructions(foodMealInstructionID INTEGER, foodMealID INTEGER, foodMealInstructionStep INTEGER, foodMealInstructionDescription TEXT, foodMealInstructionDuration INTEGER, foodMealInstructionMeanwhile INTEGER, deleted INTEGER,)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> update(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.update(
      table,
      data,
      where: 'id = ?',
      //whereArgs: table.id,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}
