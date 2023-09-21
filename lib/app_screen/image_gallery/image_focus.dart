import 'package:flutter/material.dart';

class ImageFocusPage extends StatelessWidget {
  const ImageFocusPage({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
