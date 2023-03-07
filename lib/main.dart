import 'package:fastmeals_app/dummy_data.dart';
import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filtersScreen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: prefer_final_fields
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Meals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleSmall: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold))),
      // home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (ctx) => const MealDetailsScreen(),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(saveFilters: _setFilters),
      },
    );
  }
}
