import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/parent_data.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/serviceModel.dart';

class DBRepo extends ParentRepo {
  DBRepo._init(); //constructor
  static DBRepo? _singletonObject;
  static late Database _database;

  static Future<DBRepo?> get instance async {
    if (_singletonObject == null) {
      await _initDatabase();
      _singletonObject = DBRepo._init();
    }
    return _singletonObject;
  }

  static Future<void> _initDatabase() async {
    final String databasePath = await getDatabasesPath();
    final path = join(databasePath, 'services.db');
    _database = await openDatabase(path, version: 1, onCreate: _createTables);
  }

  static Future<void> _createTables(Database db, _) async {
    await db.execute("""
      CREATE TABLE services(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        address TEXT
     )
    """);
  }

  @override
  Future<void> delete({required Comparable<num> id}) async {
    await _database.delete('services', where: "id=?", whereArgs: [id]);
  }

  @override
  Future<void> insert({required String name, String? address}) async {
    await _database.insert('services', {'name': name, 'address': address});
  }

  @override
  Future<List<ServiceModel>> fetch() async {
    return (await _database.query('services'))
        .map((e) => ServiceModel.fromJson(e))
        .toList();
  }
}
