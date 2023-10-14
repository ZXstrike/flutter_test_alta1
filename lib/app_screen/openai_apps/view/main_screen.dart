import 'package:flutter/material.dart';

class OpenAiMainScreen extends StatefulWidget {
  const OpenAiMainScreen({super.key});

  @override
  State<OpenAiMainScreen> createState() => _OpenAiMainScreenState();
}

class _OpenAiMainScreenState extends State<OpenAiMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smartphone Recommendation with OpenAI'),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
