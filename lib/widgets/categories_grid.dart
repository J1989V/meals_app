import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:provider/provider.dart';

import '../models/categories.dart';

class CategoriesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<Categories>(context);
    final categories = categoriesData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: categories.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //builder: (c) => categories[i],
        value: categories[i],
        child: CategoryItem(
          categories[i].foodCategoryID,
          categories[i].foodCategoryName,
          categories[i].foodCategoryLogo,
          categories[i].foodDescription,
          categories[i].foodColor,
          categories[i].deleted,
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
