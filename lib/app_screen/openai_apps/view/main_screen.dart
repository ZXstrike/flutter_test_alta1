import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/openai_apps/providers/openai_provider.dart';
import 'package:provider/provider.dart';

class OpenAiMainScreen extends StatefulWidget {
  const OpenAiMainScreen({super.key});

  @override
  State<OpenAiMainScreen> createState() => _OpenAiMainScreenState();
}

class _OpenAiMainScreenState extends State<OpenAiMainScreen> {
  late OpenAiProvider aiProvider;
  @override
  void initState() {
    super.initState();
    aiProvider = Provider.of<OpenAiProvider>(context, listen: false);

    aiProvider.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smartphone Recommendation with OpenAI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: aiProvider.formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                controller: aiProvider.budgetController,
                validator: (String? value) =>
                    value!.isEmpty ? 'Enter Your Budget.' : null,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  filled: true,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF49454F),
                  ),
                  hintText: 'Input Your Budget',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF49454F),
                  ),
                  labelText: 'Budget',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                controller: aiProvider.cameraSizeController,
                validator: (String? value) =>
                    value!.isEmpty ? 'Enter Camera Sensor Size.' : null,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  filled: true,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF49454F),
                  ),
                  hintText: '.. Mp',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF49454F),
                  ),
                  labelText: 'Camera sensor size',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                controller: aiProvider.storageSizeController,
                validator: (String? value) =>
                    value!.isEmpty ? 'Enter Storage Size.' : null,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  filled: true,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF49454F),
                  ),
                  hintText: '... GB',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF49454F),
                  ),
                  labelText: 'Storage Size',
                ),
              ),
              const SizedBox(height: 15),
              FilledButton(
                onPressed: aiProvider.generateRecomendation,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFF6750A4)),
                ),
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
