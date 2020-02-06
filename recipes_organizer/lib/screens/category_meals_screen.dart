import '../widgets/meal_item.dart';

import '../dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  //final String categoryId;
  //final String categoryTitle;

  //const CategoryMealsScreen({
  //  Key key,
  //  this.categoryId,
  //  this.categoryTitle,
  //}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final categoryTitle = routeArgs['title'] as String;
    final categoryId = routeArgs['id'] as String;
    final categoryColor = routeArgs['color'] as Color;
    final categoryMeals = DUMMY_MEALS
        .where((item) => item.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: categoryColor,
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var selectedMeal = categoryMeals[index];
          return MealItem(
            title: selectedMeal.title,
            imageUrl: selectedMeal.imageUrl,
            duration: selectedMeal.duration,
            complexity: selectedMeal.complexity,
            affordability: selectedMeal.affordability,
            id: selectedMeal.id,
            categoryColor: categoryColor,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
