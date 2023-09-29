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

  ScrollController scrollController = ScrollController();

  bool mode = false;

  int? contentIndex;

  Color pickedColor = Colors.blue;

  String? pickedFile = "";

  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    contactList = Provider.of<ContactListProvider>(context);
  }

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    numberController.dispose();
    dateController.dispose();
  }

  void getColorData(Color? color) {
    if (color != null) {
      pickedColor = color;
    }
  }

  void getFilePath(String? file) {
    if (file != null) {
      pickedFile = file;
    }
  }

  void edit(int index) {
    scrollController.jumpTo(0.0);
    mode = true;

    final ContactModel contact = contactList.contactList[index];

    nameController.text = contact.name;
    numberController.text = contact.number;
    dateController.text = contact.date;
    pickedColor = contact.color;
    pickedFile = contact.file;

    contentIndex = index;
  }

  void delete(int index) {
    contactList.removeContact(index);
  }

  void updateData() {
    ContactModel contact = ContactModel(
        name: nameController.text,
        number: numberController.text,
        date: dateController.text,
        color: pickedColor,
        file: pickedFile.toString());

    if (mode) {
      mode = false;

      contactList.updateContact(contentIndex!, contact);
    } else {
      contactList.addContact(contact);
    }

    nameController.clear();
    numberController.clear();
    dateController.clear();
    pickedColor = Colors.blue;

    debugPrint("Data List: ${contactList.contactList.toString()}");
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
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TittleDescBox(),
            InputField(
              fileGetter: getFilePath,
              colorGetter: getColorData,
              dateController: dateController,
              contactList: contactList.contactList,
              notifyParent: updateData,
              nameInputController: nameController,
              numberInputController: numberController,
            ),
            const Text(
              "List ContactListProvider",
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
                  final ContactModel contact = contactList.contactList[index];
                  return ContactCard(
                    filePath: contact.file,
                    name: contact.name,
                    number: contact.number,
                    date: contact.date,
                    color: contact.color.toString(),
                    delete: () => delete(index),
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
