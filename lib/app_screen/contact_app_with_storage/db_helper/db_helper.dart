import 'package:flutter_test_alta1/app_screen/contact_app_with_storage/model/contact_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  final String _tableName = 'table_contact';

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'contact_db.db'),
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE  $_tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
             name TEXT,
             number TEXT)''');
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertContact(ContactModel contactModel) async {
    final Database db = await database;
    await db.insert(
      _tableName,
      contactModel.toMap(),
    );
  }

  Future<List<ContactModel>> getContact() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((e) => ContactModel.fromMap(e)).toList();
  }

  Future<ContactModel> getContactById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((e) => ContactModel.fromMap(e)).first;
  }

  Future<void> updateContact(ContactModel contactModel) async {
    final Database db = await database;
    await db.update(
      _tableName,
      contactModel.toMap(),
      where: 'id = ?',
      whereArgs: [contactModel.id],
    );
  }

  Future<void> deleteContact(int id) async {
    final Database db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
