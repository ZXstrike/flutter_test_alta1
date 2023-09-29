import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_provider/model/contact_model.dart';

class ContactListProvider extends ChangeNotifier {
  final List<ContactModel> _contactList = [];

  List<ContactModel> get contactList => _contactList;

  void addContact(ContactModel contact) {
    _contactList.add(contact);
    notifyListeners();
  }

  void removeContact(int index) {
    _contactList.removeAt(index);
    notifyListeners();
  }

  void updateContact(int index, ContactModel contact) {
    _contactList[index] = contact;
    notifyListeners();
  }
}
