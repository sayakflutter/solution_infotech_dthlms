import 'package:sqflite_common/sqflite.dart';

import '../initializeDB/initializeDB.dart';

Future<int> insertItem(String name) async {
  final Database db = await fninitializeDB();
  return await db.insert('items', {'name': name});
}

Future<List<Map<String, dynamic>>> retrieveItems() async {
  final Database db = await fninitializeDB();
  return await db.query('items');
}

Future<int> updateItem(int id, String name) async {
  final Database db = await fninitializeDB();
  return await db.update('items', {'name': name},
      where: 'id = ?', whereArgs: [id]);
}

Future<int> deleteItem(int id) async {
  final Database db = await fninitializeDB();
  return await db.delete('items', where: 'id = ?', whereArgs: [id]);
}

Future<List<Map<String, dynamic>>> _getUsers() async {
  final Database db = await fninitializeDB();
  return await db.query('users') ?? [];
}
