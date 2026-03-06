import 'package:bytebank_poc/database/app_db.dart';
import 'package:bytebank_poc/models/contact.dart';

class ContactDao {
  static const String _tableName = "contacts";
  static const String tableSql =
      'CREATE TABLE $_tableName($_idKey INTEGER PRIMARY KEY, $_nameKey TEXT, $_accountNumberKey INTEGER)';
  static const String _idKey = "id";
  static const String _nameKey = "name";
  static const String _accountNumberKey = "account_number";

  Future<void> save(Contact contact) async {
    final Map<String, dynamic> map = {
      _idKey: contact.id,
      _nameKey: contact.name,
      _accountNumberKey: contact.accountNumber
    };
    final db = await initDatabase();
    db.insert(_tableName, map);
    findAll();
  }

  Future<List<Contact>> findAll() async {
    final contacts = await initDatabase().then((db) => db.query(_tableName));
    return contacts
        .map((e) => Contact(
            id: int.tryParse(e[_idKey].toString()) ?? 0,
            name: e[_nameKey].toString(),
            accountNumber: int.tryParse(e[_accountNumberKey].toString()) ?? 0))
        .toList();
  }
}
