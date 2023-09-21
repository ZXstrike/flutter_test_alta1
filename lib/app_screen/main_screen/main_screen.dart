import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/main_screen/navigation_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Map<String, String>> navigationRouteList = [
    {'name': 'Contact App', 'pageName': '/getContact'},
    {'name': 'Advance Input', 'pageName': '/advanceInput'},
    {'name': 'Gallery App', 'pageName': '/galleryGrid'},
    {'name': 'My Flutter App', 'pageName': '/myFlutterApp'},
    {'name': 'Material App', 'pageName': '/materialHome'},
    {'name': 'Cuppertino App', 'pageName': '/cuppertino'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'App List',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: navigationRouteList.length,
          itemBuilder: (context, index) {
            final Map<String, String> currentRoute = navigationRouteList[index];
            return NavigationCard(
              screenName: currentRoute['name']!,
              pageName: currentRoute['pageName']!,
            );
          },
        ),
      ),
    );
  }
}
