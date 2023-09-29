import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.contactList,
    required this.notifyParent,
    required this.nameInputController,
    required this.numberInputController,
    required this.formKey,
    required this.nameValidation,
    required this.numberValidation,
  });

  final List contactList;
  final GlobalKey<FormState> formKey;

  final Function(String?) nameValidation;

  final Function(String?) numberValidation;

  final TextEditingController nameInputController;

  final TextEditingController numberInputController;

  final void Function() notifyParent;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              maxLines: 1,
              controller: widget.nameInputController,
              validator: (String? value) {
                return widget.numberValidation(value);
              },
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
                hintText: 'Input Your Name',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              keyboardType: TextInputType.phone,
              maxLines: 1,
              controller: widget.numberInputController,
              validator: (String? value) {
                return widget.nameValidation(value);
              },
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
                hintText: 'Input Your Phone Number',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                labelText: 'Number',
              ),
            ),
            const SizedBox(height: 15),
            FilledButton(
              onPressed: widget.notifyParent,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xFF6750A4)),
              ),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
