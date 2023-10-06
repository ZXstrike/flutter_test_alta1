import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/provider/shared_preference.dart';
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/view/login/input_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late SharedPrefProvider spp;

  @override
  void initState() {
    super.initState();
    spp = Provider.of<SharedPrefProvider>(context, listen: false);
    spp.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<SharedPrefProvider>(
          builder: (context, value, child) => AccountInputField(
              usernameController: value.usernameController,
              emailController: value.emailController,
              passwordController: value.passwordController,
              formkey: value.formkey,
              login: value.login),
        ),
      ),
    );
  }
}
