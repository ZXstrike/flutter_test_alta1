import "package:flutter/material.dart";
import 'package:flutter_test_alta1/app_screen/contact_app_with_storage/model/contact_model.dart';
import 'package:flutter_test_alta1/app_screen/contact_app_with_storage/provider/contact_db_manager.dart';
import 'package:flutter_test_alta1/app_screen/contact_app_with_storage/provider/shared_preference.dart';
import 'package:flutter_test_alta1/app_screen/contact_app_with_storage/view/contact_page/contact_card.dart';
import 'package:flutter_test_alta1/app_screen/contact_app_with_storage/view/contact_page/input_field.dart';
import 'package:flutter_test_alta1/app_screen/contact_app_with_storage/view/contact_page/tittle_and_description.dart';
import 'package:provider/provider.dart';

class GetContactView extends StatefulWidget {
  const GetContactView({super.key});

  @override
  State<GetContactView> createState() => _GetContactViewState();
}

class _GetContactViewState extends State<GetContactView> {
  late SharedPrefProvider loginData;
  late ContactListDbProvider contactList;

  String username = 'Contact';

  ScrollController scrollController = ScrollController();

  bool mode = false;

  int? contentIndex;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginData = Provider.of<SharedPrefProvider>(context, listen: false);
    contactList = Provider.of<ContactListDbProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    numberController.dispose();
  }

  void logOut() {
    showDialog(
      context: context,
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
              loginData.loginData.setBool('login', true);
              loginData.loginData.remove('username');
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

  void edit(int index) {
    scrollController.jumpTo(0.0);
    mode = true;

    final ContactModel contact = contactList.contactModels[index];

    nameController.text = contact.name;
    numberController.text = contact.number;

    contentIndex = contact.id;
  }

  void delete(int id) {
    contactList.deleteContact(id);
  }

  void updateData() {
    ContactModel contact = ContactModel(
      name: nameController.text,
      number: numberController.text,
    );

    if (mode) {
      mode = false;
      contact.id = contentIndex;
      contactList.changeContact(contact);
    } else {
      contactList.addContact(contact);
    }

    nameController.clear();
    numberController.clear();

    debugPrint("Data List: ${contactList.contactModels.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(username),
        actions: [
          IconButton(
            onPressed: () => logOut(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TittleDescBox(),
            InputField(
              notifyParent: updateData,
              nameInputController: nameController,
              numberInputController: numberController,
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
                    delete: () => delete(contact.id!),
                    edit: () => edit(index),
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
