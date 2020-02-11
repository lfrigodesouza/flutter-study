import '../models/meal.dart';
import '../widgets/meal_item.dart';

import '../dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  Color categoryColor;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'] as String;
      categoryColor = routeArgs['color'] as Color;
      displayedMeals = DUMMY_MEALS
          .where((item) => item.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: categoryColor,
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var selectedMeal = displayedMeals[index];
          return MealItem(
            title: selectedMeal.title,
            imageUrl: selectedMeal.imageUrl,
            duration: selectedMeal.duration,
            complexity: selectedMeal.complexity,
            affordability: selectedMeal.affordability,
            id: selectedMeal.id,
            categoryColor: categoryColor,
            removeHandler: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
