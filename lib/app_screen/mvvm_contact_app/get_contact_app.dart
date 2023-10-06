import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/provider/contact_db_manager.dart';
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/provider/shared_preference.dart';
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/view/contact_page/get_contact_view.dart';
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/view/login/login_screen.dart';
import 'package:provider/provider.dart';

class GetContactLoginAppMVVM extends StatelessWidget {
  const GetContactLoginAppMVVM({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ContactListDbProvider>(
          create: (_) => ContactListDbProvider(),
        ),
        ChangeNotifierProvider<SharedPrefProvider>(
          create: (_) => SharedPrefProvider(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              );

            case '/contactView':
              return MaterialPageRoute(
                builder: (context) => const GetContactView(),
              );
          }
          return null;
        },
      ),
    );
  }
}
