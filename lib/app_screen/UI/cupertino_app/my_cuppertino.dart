import 'package:flutter/cupertino.dart';
import 'package:flutter_test_alta1/app_screen/UI/cupertino_app/cupertino_home_page.dart';

class MyAppCupertino extends StatelessWidget {
  const MyAppCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupertinoHomePage(),
    );
  }
}
