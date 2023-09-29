import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_provider/provider/contacts.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_provider/view/get_contact_view.dart';
import 'package:provider/provider.dart';

class GetContactProviderApp extends StatelessWidget {
  const GetContactProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<ContactListProvider>(
            create: (_) => ContactListProvider(),
          )
        ],
        child: const GetContactView(),
      ),
    );
  }
}
