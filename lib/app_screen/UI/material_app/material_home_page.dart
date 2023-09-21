import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/UI/material_app/home_page_drawer.dart';
import 'package:flutter_test_alta1/app_screen/UI/material_app/home_page_listview.dart';

class MaterialHomePage extends StatefulWidget {
  const MaterialHomePage({super.key});

  @override
  State<MaterialHomePage> createState() => _MaterialHomePageState();
}

class _MaterialHomePageState extends State<MaterialHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp'),
      ),
      drawer: const Drawer(child: SafeArea(child: MaterialHomePageDrawer())),
      // body: const Center(
      //   child: Text('This is material App'),
      // ),
      body: const HomePageListView(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
