import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/openai_apps/services/recomendation.dart';
import 'package:flutter_test_alta1/app_screen/openai_apps/view/resuld_screen.dart';

class OpenAiProvider extends ChangeNotifier {
  String? recomendation;

  final formKey = GlobalKey<FormState>();

  late final BuildContext context;

  final TextEditingController budgetController = TextEditingController();
  final TextEditingController cameraSizeController = TextEditingController();
  final TextEditingController storageSizeController = TextEditingController();

  void generateRecomendation() async {
    final isValidate = formKey.currentState!.validate();

    if (isValidate) {
      final data = await RecomendationServices.getRecomendation(
        budget: budgetController.text,
        cameraSensorSize: cameraSizeController.text,
        storageSize: storageSizeController.text,
      );

      recomendation = data.choices[0].text;

      budgetController.clear();
      cameraSizeController.clear();
      storageSizeController.clear();
      notifyListeners();

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScree(result: recomendation!),
        ),
      );
    }
  }
}
