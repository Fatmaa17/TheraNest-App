// ignore_for_file: file_names

import 'package:sqflite/sqflite.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/service_model/serviceModel.dart';

class DBRepo {
  late Database database;

  Future<void> initDatabase() async {
    database = await openDatabase(
      (await getDatabasesPath()) + '/services.db',
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE services (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          specialty TEXT,
          sessionPrice REAL,
          experienceYears INTEGER,
          languages TEXT,
          fields TEXT
        )
      ''');
      },
    );
  }

  Future<void> insertServices(
    String name,
    String specialty,
    double sessionPrice,
    int experienceYears,
    List<String> languages,
    List<String> fields,
  ) async {
    database.insert('services', {
      'name': name,
      'specialty': specialty,
      'session_price': sessionPrice,
      'experience_years': experienceYears,
      'languages': languages.join(','),
      'fields': fields.join(','),
    });
  }

  Future<List<ServiceModel>> fetchServices() async {
    return (await database.query('services'))
        .map((e) => ServiceModel.fromJson(e))
        .toList();
  }
}
/*
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



  Future<void> insert({required String name, String? specialty}) async {
    await _database.insert('services', {'name': name, 'specialty': specialty});
  }
}
*/