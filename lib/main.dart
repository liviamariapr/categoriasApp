
import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_sreenc.dart';
import 'utils/app_routes.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/settings_screen.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Vamos cozinhar?',
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.light(
        primary: Colors.pink,
        secondary: Colors.amber,
  ),
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',),
            titleMedium: TextStyle(
              fontSize: 18,
              fontFamily: 'Raleway',
            ),
            ),
        ),
      routes: {
         AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(),
      },
      onGenerateRoute: (settings){ // caso tenha algum problema na rota
        if (settings.name == '/alguma-coisa'){
          return null;
        } else {
          return MaterialPageRoute(
            builder: (_){
              return CategoriesScreen();
            }
          );
        }
      },
      onUnknownRoute: (settings){ // mesmo que o metodo que o anterior
        return MaterialPageRoute(
            builder: (_){
              return CategoriesScreen();
            }
          );
      }
    );
  } 

}


