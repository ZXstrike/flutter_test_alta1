import "package:flutter/material.dart";
import 'package:flutter_test_alta1/app_screen/get_contact_provider/model/contact_model.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_provider/provider/contacts.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_provider/view/contact_card.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_provider/view/input_field.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_provider/view/tittle_and_description.dart';
import 'package:provider/provider.dart';

class GetContactView extends StatefulWidget {
  const GetContactView({super.key});

  @override
  State<GetContactView> createState() => _GetContactViewState();
}

class _GetContactViewState extends State<GetContactView> {
  late ContactListProvider contactList;

  @override
  void initState() {
    super.initState();

    contactList = Provider.of<ContactListProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ContactListProvider'),
      ),
      body: SingleChildScrollView(
        controller: contactList.scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TittleDescBox(),
            InputField(
              formKey: contactList.formKey,
              nameValidation: contactList.validatingNumber,
              numberValidation: contactList.validatingName,
              contactList: contactList.contactList,
              notifyParent: contactList.updateContact,
              nameInputController: contactList.nameController,
              numberInputController: contactList.numberController,
            ),
            const Text(
              "Contact List",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            Consumer<ContactListProvider>(
              builder: (context, value, child) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: contactList.contactList.length,
                itemBuilder: (context, index) {
                  final ContactModel contact = value.contactList[index];
                  return ContactCard(
                    name: contact.name,
                    number: contact.number,
                    delete: () => value.removeContact(index),
                    edit: () => value.editContact(index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
