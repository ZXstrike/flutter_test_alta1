import 'package:flutter/material.dart';

class JustForTesting extends StatelessWidget {
  const JustForTesting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Just For Testing'),
      ),
      body: const Column(
        children: [
          Text('Just For Testing'),
          Icon(Icons.edit),
        ],
      ),
    );
  }
}
