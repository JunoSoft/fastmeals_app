import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName ='/category_meals';
// CategoryMealsScreen(
//       {super.key});

  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routesArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: const Center(
        child: Text('REcipes View'),
      ),
    );
  }
}
