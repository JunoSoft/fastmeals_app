enum Complexity { Hard, Challenging, Simple }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  const Meal(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.ingredients,
      required this.categories,
      required this.duration,
      required this.affordability,
      required this.complexity,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.steps});
}
