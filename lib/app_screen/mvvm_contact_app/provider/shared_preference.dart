import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefProvider extends ChangeNotifier {
  late SharedPreferences loginData;
  BuildContext? context;
  late bool newUser;

  final formkey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SharedPrefProvider() {
    initProvider();
  }

  Future<void> initProvider() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool('login') ?? true;

    if (!newUser) {
      _loginNav();
    }
  }

  void _loginNav() {
    if (context != null) {
      Navigator.pushNamedAndRemoveUntil(
        context!,
        '/contactView',
        (route) => false,
      );
    }
  }

  void login() {
    final isValidForm = formkey.currentState!.validate();

    String username = usernameController.text;
    if (isValidForm) {
      loginData.setBool('login', false);
      loginData.setString('username', username);

      _loginNav();
    }
  }

  void logOut() {
    showDialog(
      context: context!,
      builder: (context) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              loginData.setBool('login', true);
              loginData.remove('username');
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
