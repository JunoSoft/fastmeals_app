import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> favoriteMeals;
   FavoriteScreen({super.key,required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return const Center(child: Text('yoyu have no favorite yet - start adding some'),);
    }
    else{

    return  ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            duration: favoriteMeals[index].duration,
         
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}