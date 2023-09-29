import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_provider/model/contact_model.dart';

class ContactListProvider extends ChangeNotifier {
  final List<ContactModel> _contactList = [];

  ScrollController scrollController = ScrollController();

  final formKey = GlobalKey<FormState>();

  bool isEditMode = false;

  int? contentIndex;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<ContactModel> get contactList => _contactList;

  void _addContact(ContactModel contact) {
    _contactList.add(contact);
    notifyListeners();
  }

  void _changeContact(int index, ContactModel contact) {
    _contactList[index] = contact;
    notifyListeners();
  }

  void removeContact(int index) {
    _contactList.removeAt(index);
    notifyListeners();
  }

  void editContact(int index) {
    scrollController.jumpTo(0.0);
    isEditMode = true;

    final ContactModel contact = _contactList[index];

    nameController.text = contact.name;
    numberController.text = contact.number;

    contentIndex = index;
  }

  void updateContact() {
    ContactModel contact = ContactModel(
      name: nameController.text,
      number: numberController.text,
    );

    if (formKey.currentState!.validate()) {
      if (isEditMode) {
        isEditMode = false;

        _changeContact(contentIndex!, contact);
      } else {
        _addContact(contact);
      }
    }

    nameController.clear();
    numberController.clear();

    debugPrint("Data List: ${_contactList.toString()}");
  }

//Valitaditon

  validatingName(String? name) {
    if (name!.trim().isEmpty) {
      return "Name field Is Empty!";
    } else if (name.split(" ").length < 2) {
      return "Name must more than 2 word!";
    } else if (isStringOnlyLetters(name) == false) {
      return "Name must only contain letters!";
    } else if (name.trim().split('')[0] !=
        name.trim().split('')[0].toUpperCase()) {
      return "Name must start with Uppercase!";
    }
    return null;
  }

  bool isStringOnlyLetters(String str) {
    return str.trim().isNotEmpty &&
        str
            .split(' ')
            .join()
            .split('')
            .every((char) => RegExp(r'^[a-zA-Z]+$').hasMatch(char));
  }

  validatingNumber(String? nmbr) {
    final number = nmbr!.split(' ').join().split('').join();

    if (number.length < 8 || number.length > 15) {
      return "Phone number length must minimum is 8 and maximum is 15!";
    } else if (!isStringOnlyNumeric(nmbr)) {
      return "Phone number must only contain number!";
    } else if (!number.startsWith('0')) {
      return "Phone number must start with 0!";
    }
    return null;
  }

  bool isStringOnlyNumeric(String str) {
    return str.trim().isNotEmpty &&
        str
            .split(' ')
            .join()
            .split('')
            .every((char) => int.tryParse(char) != null);
  }
}
