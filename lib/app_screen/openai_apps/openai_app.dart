import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/openai_apps/providers/openai_provider.dart';
import 'package:flutter_test_alta1/app_screen/openai_apps/view/main_screen.dart';
import 'package:provider/provider.dart';

class OpenAiApp extends StatelessWidget {
  const OpenAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OpenAiProvider(),
        )
      ],
      builder: (context, child) => const MaterialApp(
        home: OpenAiMainScreen(),
      ),
    );
  }
}
