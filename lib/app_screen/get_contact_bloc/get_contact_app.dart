import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_bloc/bloc/contact_list_bloc.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_bloc/view/get_contact_view.dart';

class GetContactBlocApp extends StatelessWidget {
  const GetContactBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactListBloc(),
        ),
      ],
      child: const MaterialApp(
        home: GetContactView(),
      ),
    );
  }
}
