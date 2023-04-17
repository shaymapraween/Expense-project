import 'package:flutter/material.dart';
import 'package:myapp/dummy_data.dart';
import 'package:myapp/models/meals.dart';
import 'package:myapp/screens/meals_details_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import '/screens/meals_details_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meals> _avilableMeals = DUMMY_MEALS;
  List<Meals> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _avilableMeals = DUMMY_MEALS.where((Meals) {
        if (_filters['gluten']! && Meals.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && Meals.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && Meals.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && Meals.isVegetarian) {
          return false;
        }
        return true;
        //..
      })
          //...
          .toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delimeals',
      theme: ThemeData(primarySwatch: Colors.purple),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_avilableMeals),
        MealsDetailScreen.routeName: (ctx) =>
            MealsDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   if (settings.name == '/meal-detail') {
      //   } else if (settings.name == '/something-else') {}

      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // }
      // onUnknownRoute:(settings) {
      //   return MaterialPageRoute(builder:(ctx)=> CategoriesScreen() );

      // }
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
