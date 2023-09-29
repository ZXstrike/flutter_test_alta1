import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountInputField extends StatefulWidget {
  const AccountInputField({super.key, required this.loginData});

  final SharedPreferences loginData;

  @override
  State<AccountInputField> createState() => _AccountInputFieldState();
}

class _AccountInputFieldState extends State<AccountInputField> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              maxLines: 1,
              controller: _usernameController,
              validator: (String? value) =>
                  value!.isEmpty ? 'Enter Your Name.' : null,
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
                hintText: 'Input Your Username',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                labelText: 'Username',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 1,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (String? value) => value!.isEmpty
                  ? 'Enter Your Email.'
                  : !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)
                      ? 'Enter a Valid Email.'
                      : null,
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
                hintText: 'your.email@mail.com',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 1,
              obscureText: true,
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              validator: (String? value) =>
                  value!.isEmpty ? 'Enter Your Password.' : null,
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
                hintText: 'Enter password',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                final isValidForm = _formkey.currentState!.validate();

                String username = _usernameController.text;
                if (isValidForm) {
                  final SharedPreferences loginData = widget.loginData;
                  loginData.setBool('login', false);
                  loginData.setString('username', username);

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/contactView',
                    (route) => false,
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
