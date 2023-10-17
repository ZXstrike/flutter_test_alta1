import 'package:flutter/material.dart';

class ResultScree extends StatelessWidget {
  const ResultScree({super.key, required this.result});

  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(result),
      ),
    );
  }
}
