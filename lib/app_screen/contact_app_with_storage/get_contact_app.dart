import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/contact_app_with_storage/view/login/login_screen.dart';
import 'package:flutter_test_alta1/app_screen/contact_app_with_storage/provider/contact_db_manager.dart';
import 'package:flutter_test_alta1/app_screen/contact_app_with_storage/view/contact_page/get_contact_view.dart';
import 'package:provider/provider.dart';

class GetContactLoginApp extends StatelessWidget {
  const GetContactLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ContactListDbProvider>(
          create: (_) => ContactListDbProvider(),
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
