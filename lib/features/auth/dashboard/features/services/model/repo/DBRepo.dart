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
          fields TEXT,
          activity INTEGER
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
      'activity': 0,
    });
  }

   Future<void> updateActivity(int val,int id)
 async {
 await database.update('servicesTable',
{
  'activity' :val,
}
, where:'id=?',whereArgs: [id]);
 }


  Future<List<ServiceModel>> fetchActivityServices() async {
  return(await database.query('servicesTable'
  ,where: 'activity=?',whereArgs: [1])).map((e) => ServiceModel.fromJson(e)).toList();
 }
}
