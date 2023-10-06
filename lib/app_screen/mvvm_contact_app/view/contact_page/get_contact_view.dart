import "package:flutter/material.dart";
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/model/contact_model.dart';
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/provider/contact_db_manager.dart';
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/provider/shared_preference.dart';
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/view/contact_page/contact_card.dart';
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/view/contact_page/input_field.dart';
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/view/contact_page/tittle_and_description.dart';
import 'package:provider/provider.dart';

class GetContactView extends StatefulWidget {
  const GetContactView({super.key});

  @override
  State<GetContactView> createState() => _GetContactViewState();
}

class _GetContactViewState extends State<GetContactView> {
  late SharedPrefProvider loginData;
  late ContactListDbProvider contactList;

  String? username;

  @override
  void initState() {
    super.initState();
    loginData = Provider.of<SharedPrefProvider>(context, listen: false);
    contactList = Provider.of<ContactListDbProvider>(context, listen: false);
    loginData.context = context;
    username = loginData.loginData.getString('username');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(username!),
        actions: [
          IconButton(
            onPressed: () => loginData.logOut(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: contactList.scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TittleDescBox(),
            InputField(
              notifyParent: contactList.updateContact,
              nameInputController: contactList.nameController,
              numberInputController: contactList.numberController,
            ),
            const Text(
              "List Contact",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            Consumer<ContactListDbProvider>(
              builder: (context, value, child) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.contactModels.length,
                itemBuilder: (context, index) {
                  final ContactModel contact = value.contactModels[index];
                  return ContactCard(
                    name: contact.name,
                    number: contact.number,
                    delete: () => contactList.deleteContact(contact.id!),
                    edit: () => contactList.editContact(contact),
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
