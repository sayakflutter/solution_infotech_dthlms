import 'package:path/path.dart';
import 'package:sqflite_common/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';

Future<Database> fninitializeDB() async {
  String path = await getDatabasesPath();
  print(path);
  return openDatabase(
    join(await getDatabasesPath(), 'example.db'),
    onCreate: (database, version) async {
      await database.execute(
        "CREATE TABLE items(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)",
      );
    },
    version: 1,
  );
}
