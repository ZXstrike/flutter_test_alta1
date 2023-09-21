import 'package:flutter/material.dart';

class NavigationCard extends StatelessWidget {
  const NavigationCard({
    super.key,
    required this.screenName,
    required this.pageName,
  });

  final String screenName;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, pageName);
      },
      child: Card(
        child: SizedBox(
          height: 100,
          child: Center(
            child: Text(
              screenName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
