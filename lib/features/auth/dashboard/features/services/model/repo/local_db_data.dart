import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/serviceModel.dart';

class DBRepo {
  DBRepo._init(); // Constructor

  static DBRepo? _singletonObject;
  static late Database _database;

  static Future<void> _initDatabase() async {
    final String databasePath = await getDatabasesPath();
    final path = join(databasePath, 'services.db');
    _database = await openDatabase(path, version: 1, onCreate: _createTables);
  }

  Future<int> create({
    required String name,
    String? specialty,
    double? sessionPrice,
    int? experienceYears,
    List<String>? languages,
    List<String>? fields,
  }) async {
    // Ensure that the database is initialized
    if (_database == null) {
      await _initDatabase();
    }

    final Map<String, dynamic> row = {
      'name': name,
      'specialty': specialty,
      'session_price': sessionPrice,
      'experience_years': experienceYears,
      'languages': languages?.join(','),
      'fields': fields?.join(','),
    };

    return await _database.insert('services', row);
  }

  static Future<DBRepo?> get instance async {
    if (_singletonObject == null) {
      await _initDatabase();
      _singletonObject = DBRepo._init();
    }
    return _singletonObject;
  }

  static Future<void> _createTables(Database db, _) async {
    await db.execute("""
    CREATE TABLE services(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      specialty TEXT,
      session_price REAL,
      experience_years INTEGER,
      languages TEXT,
      fields TEXT
    )
  """);
  }

  Future<List<ServiceModel>> fetch() async {
    if (_database == null) {
      await _initDatabase();
    }
    return (await _database.query('services'))
        .map((e) => ServiceModel.fromJson(e))
        .toList();
  }

  Future<void> insert({required String name, String? specialty}) async {
    if (_database == null) {
      await _initDatabase();
    }
    await _database.insert('services', {'name': name, 'specialty': specialty});
  }
}
