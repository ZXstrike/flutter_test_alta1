import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/UI/prototype/my_flutter_app.dart';

class MyFlutter extends StatelessWidget {
  const MyFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 98, 0, 238),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            foregroundColor: Colors.black,
            backgroundColor: Color.fromARGB(255, 3, 218, 197),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            backgroundColor: Color.fromARGB(255, 98, 0, 238),
          )),
      home: const MyFlutterApp(),
    );
  }
}
