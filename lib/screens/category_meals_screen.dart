import 'package:flutter/material.dart';


import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category_meals';
  List<Meal> availableMeals;
  CategoryMealsScreen(@required this.availableMeals);
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeal;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routesArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routesArgs['title']!;
      final categoryId = routesArgs['id'];

      displayedMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal?.removeWhere((meal) => meal.id == mealId);
    });
  }

// CategoryMealsScreen(
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal![index].id,
            title: displayedMeal![index].title,
            imageUrl: displayedMeal![index].imageUrl,
            complexity: displayedMeal![index].complexity,
            affordability: displayedMeal![index].affordability,
            duration: displayedMeal![index].duration,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeal!.length,
      ),
    );
  }
}
