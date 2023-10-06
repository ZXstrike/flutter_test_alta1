import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/model/contact_db/contact_db.dart.dart';
import 'package:flutter_test_alta1/app_screen/mvvm_contact_app/model/contact_model.dart';

class ContactListDbProvider extends ChangeNotifier {
  List<ContactModel> _contaclModels = [];
  late DatabaseHelper _dbHelper;

  List<ContactModel> get contactModels => _contaclModels;

  ScrollController scrollController = ScrollController();

  bool isEditMode = false;

  int? contactIndex;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  ContactListDbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllContact();
  }

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    numberController.dispose();
  }

  void _getAllContact() async {
    _contaclModels = await _dbHelper.getContact();
    notifyListeners();
  }

  Future<void> _addContact(ContactModel contactModel) async {
    await _dbHelper.insertContact(contactModel);
    _getAllContact();
  }

  Future<ContactModel> getContactById(int id) async {
    return await _dbHelper.getContactById(id);
  }

  void _changeContact(ContactModel contactModel) async {
    await _dbHelper.updateContact(contactModel);
    _getAllContact();
  }

  void editContact(ContactModel contact) {
    scrollController.jumpTo(0.0);
    isEditMode = true;

    nameController.text = contact.name;
    numberController.text = contact.number;

    contactIndex = contact.id;
  }

  void updateContact() {
    ContactModel contact = ContactModel(
      name: nameController.text,
      number: numberController.text,
    );

    if (isEditMode) {
      isEditMode = false;
      contact.id = contactIndex;
      _changeContact(contact);
    } else {
      _addContact(contact);
    }

    nameController.clear();
    numberController.clear();

    debugPrint("Data List: ${contactModels.toString()}");

    _getAllContact();
  }

  void deleteContact(int id) async {
    await _dbHelper.deleteContact(id);
    _getAllContact();
  }

  validatingName(String name) {
    if (name.trim().isEmpty) {
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

  validatingNumber(String nmbr) {
    final number = nmbr.split(' ').join().split('').join();

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
