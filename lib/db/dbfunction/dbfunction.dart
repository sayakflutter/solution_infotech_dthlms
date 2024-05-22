import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common/sqflite.dart';

class DbHandler {
  Database? _database;

  Future<Database?> get fninitializeDB async {
    String path = await getDatabasesPath();

    _database = await createtable(path);
    return _database;
  }

  insertData(String username, String pass) async {
    Database? db = await fninitializeDB;

    return await db!.insert('Login', {'username': username, 'password': pass});
  }

  readData() async {
    Database? db = await fninitializeDB;
    final list = await db!.query('Login');
    for (int i = 0; i < list.length; i++) {
      if (kDebugMode) {
        print('${list[i]}\n');
      }
    }
    return list;
  }

  createtable(String path) async {
    return await openDatabase(
      join(path, 'sayakdb.db'),
    );
  }
}
