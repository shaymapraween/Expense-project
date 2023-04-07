import 'package:flutter/material.dart';
import 'package:myapp/screens/meals_details_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import '/screens/meals_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delimeals',
      theme: ThemeData(primarySwatch: Colors.purple),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealsDetailScreen.routeName: (ctx) => MealsDetailScreen(),
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
    );
  }
}
