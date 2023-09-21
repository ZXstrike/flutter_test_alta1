import 'package:flutter/material.dart';

class MaterialHomePageDrawer extends StatelessWidget {
  const MaterialHomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Text('Home'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Text('Setting'),
        ),
      ],
    );
  }
}
