import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/provider/contact_db_manager.dart';
import 'package:provider/provider.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.notifyParent,
    required this.nameInputController,
    required this.numberInputController,
  });

  final TextEditingController nameInputController;

  final TextEditingController numberInputController;

  final void Function() notifyParent;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ContactListDbProvider contactProvider =
        Provider.of<ContactListDbProvider>(context);
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              maxLines: 1,
              controller: widget.nameInputController,
              validator: (String? value) {
                return contactProvider.validatingName(value!);
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
                return contactProvider.validatingNumber(value!);
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
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  return widget.notifyParent();
                }
              },
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
