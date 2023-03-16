import 'package:flutter/material.dart';
import 'package:flutter_example_widget_test/provider/favourite_list_provider.dart';
import 'package:flutter_example_widget_test/provider/todo_list_provider.dart';
import 'package:flutter_example_widget_test/screen/favourites.dart';
import 'package:flutter_example_widget_test/screen/home.dart';
import 'package:flutter_example_widget_test/screen/todo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp(key: UniqueKey()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavouriteProvider>(create: (context) => FavouriteProvider()),
        ChangeNotifierProvider(create: (context) => TodoProvider()),
      ],
      builder: (context, child) => MaterialApp(
        title: "Testing App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          FavouritesPage.routeName: (context) => const FavouritesPage(),
          TodoPage.routeName: (context) => TodoPage(),
        },
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
