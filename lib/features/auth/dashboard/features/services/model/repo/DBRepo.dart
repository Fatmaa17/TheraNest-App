import 'dart:developer';
import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/service_model/serviceModel.dart';

class DBRepo {
  late Database database;

  Future<void> initDatabase() async {
    database = await openDatabase(
      '${await getDatabasesPath()}/servicesDB.db',
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE servicesTable (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          image BLOB,
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

  Future<List<ServiceModel>> fetchServices() async {
    log((await database.getVersion()).toString());
    return (await database.query('servicesTable'))
        .map((e) => ServiceModel.fromJson(e))
        .toList();
  }

  Future<void> insertServices(
    Uint8List image,
    String name,
    String specialty,
    double sessionPrice,
    int experienceYears,
    List<String> languages,
    List<String> fields,
  ) async {
    await database.insert('servicesTable', {
      'image': image,
      'name': name,
      'specialty': specialty,
      'sessionPrice': sessionPrice,
      'experienceYears': experienceYears,
      'languages': languages.join(','),
      'fields': fields.join(','),
    });
  }
}
