import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_alta1/app_screen/contact_app_with_storage/view/contact_page/validation_function.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_bloc/bloc/contact_list_bloc.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_bloc/model/contact_model.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_bloc/view/contact_card.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_bloc/view/input_field.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_bloc/view/tittle_and_description.dart';

class GetContactView extends StatefulWidget {
  const GetContactView({super.key});

  @override
  State<GetContactView> createState() => _GetContactViewState();
}

class _GetContactViewState extends State<GetContactView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ContactListBloc'),
        ),
        body: BlocConsumer<ContactListBloc, ContactListState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              controller: state.scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TittleDescBox(),
                  InputField(
                    formKey: null,
                    nameValidation: validatingName,
                    numberValidation: validatingNumber,
                    contactList: state.contactList,
                    notifyParent: () => context
                        .read<ContactListBloc>()
                        .add(UpdateContactEvent()),
                    nameInputController: state.nameController,
                    numberInputController: state.numberController,
                  ),
                  const Text(
                    "Contact List",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.contactList.length,
                    itemBuilder: (context, index) {
                      final ContactModel contact = state.contactList[index];
                      return ContactCard(
                        name: contact.name,
                        number: contact.number,
                        delete: () => context
                            .read<ContactListBloc>()
                            .add(DeleteContactEvent(index)),
                        edit: () => context
                            .read<ContactListBloc>()
                            .add(EditContactEvent(index)),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ));
  }
}
