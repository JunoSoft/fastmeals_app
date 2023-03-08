import 'package:flutter/material.dart';
import '../screens/favorite_screen.dart';
import '../screens/categories_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;

    TabsScreen({super.key,required this.favoriteMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
  
}

class _TabsScreenState extends State<TabsScreen> {
 List<Map<String, dynamic>>? _pages ;
  int _selectedPageIndex = 0;
  @override
  void initState() {
_pages = [
    {'page': const CategoriesScreen(), 'title': 'Categories'},
    {'page':  FavoriteScreen(favoriteMeals:widget.favoriteMeals), 'title': 'Favorites'}
  ];
    super.initState();
  }
  void _selectTab(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedPageIndex]['title']),
      ),
      body: _pages![_selectedPageIndex]['page'],
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectTab,
          currentIndex: _selectedPageIndex,
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.shifting,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.category),
                label: 'Categories',
                backgroundColor: Theme.of(context).primaryColor),
            BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                label: 'favorites',
                backgroundColor: Theme.of(context).primaryColor),
          ]),
    );
  }
}
