
import "package:flutter/material.dart";
import 'package:flutter_test_alta1/app_screen/get_contact_screen/contact_card.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_screen/input_field.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_screen/tittle_and_description.dart';

class GetContactView extends StatefulWidget {
  const GetContactView({super.key});

  @override
  State<GetContactView> createState() => _GetContactViewState();
}

class _GetContactViewState extends State<GetContactView> {
  List<Map<String, dynamic>> contactList = [];

  bool mode = false;

  int? contentIndex;

  Color pickedColor = Colors.blue;

  String? pickedFile;

  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

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
    mode = true;

    nameController.text = contactList[index]["name"]!;
    numberController.text = contactList[index]["number"]!;
    dateController.text = contactList[index]["date"]!;
    pickedColor = contactList[index]["color"]!;

    if (contactList[index].containsKey("file")) {
      pickedFile = contactList[index]["file"];
    }

    contentIndex = index;
  }

  void delete(int index) {
    setState(() {
      contactList.removeAt(index);
    });
  }

  void updateData() {
    Map<String, dynamic> contactData = {
      "name": nameController.text,
      "number": numberController.text,
      "date": dateController.text,
      "color": pickedColor,
      "file": " "
    };

    if (pickedFile != null) {
      contactData["file"] = pickedFile;
    }

    setState(() {
      if (mode) {
        mode = false;

        contactList[contentIndex!] = contactData;
      } else {
        contactList.add(contactData);
      }

      nameController.clear();
      numberController.clear();
      dateController.clear();
      pickedColor = Colors.blue;
    });

    debugPrint("Data List: ${contactList.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contacts'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TittleDescBox(),
            InputField(
              fileGetter: getFilePath,
              colorGetter: getColorData,
              dateController: dateController,
              contactList: contactList,
              notifyParent: updateData,
              nameInputController: nameController,
              numberInputController: numberController,
            ),
            const Text(
              "List Contacts",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> contact = contactList[index];
                return ContactCard(
                  filePath: contact["file"],
                  name: contact["name"]!,
                  number: contact["number"]!,
                  date: contact["date"]!,
                  color: contact["color"].toString(),
                  delete: () => delete(index),
                  edit: () => edit(index),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
