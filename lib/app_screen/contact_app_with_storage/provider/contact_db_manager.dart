import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/contact_app_with_storage/db_helper/db_helper.dart';
import 'package:flutter_test_alta1/app_screen/contact_app_with_storage/model/contact_model.dart';

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

  void _getAllContact() async {
    _contaclModels = await _dbHelper.getContact();
    notifyListeners();
  }

  Future<void> addContact(ContactModel contactModel) async {
    await _dbHelper.insertContact(contactModel);
    _getAllContact();
  }

  Future<ContactModel> getContactById(int id) async {
    return await _dbHelper.getContactById(id);
  }

  void changeContact(ContactModel contactModel) async {
    await _dbHelper.updateContact(contactModel);
    _getAllContact();
  }

  void updateContact() {}

  void deleteContact(int id) async {
    await _dbHelper.deleteContact(id);
    _getAllContact();
  }
}
