import 'package:flutter/material.dart';

import './dummy_data.dart';
import './category_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Fast Meals'),
      ),
      body: GridView(
        padding:const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES
            .map((category) =>
                CategoryItem(title: category.title, color: category.color))
            .toList(),
      ),
    );
  }
}
