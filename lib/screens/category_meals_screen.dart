import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category_meals';
// CategoryMealsScreen(
//       {super.key});

  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routesArgs['title'];
    final categoryId = routesArgs['id'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              duration: categoryMeals[index].duration);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
