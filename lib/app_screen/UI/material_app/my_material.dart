import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/UI/material_app/material_home_page.dart';

class MyAppMaterial extends StatelessWidget {
  const MyAppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MaterialHomePage(),
    );
  }
}
