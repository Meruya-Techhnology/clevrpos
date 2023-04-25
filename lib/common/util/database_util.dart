import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseUtil {
  static const databaseName = 'clevrpos_database.db';
  static const databaseVersion = 1;

  static Future<Database> initialize() async {
    final database = openDatabase(
      databaseName,
      version: databaseVersion,
      onCreate: (database, version) {
        /// DDL slot, execute table
        debugPrint('Database Created');
        createItemTable(
          database: database,
        );
      },
    );
    return database;
  }

  static Future<void> createItemTable({
    required Database database,
  }) async {
    /// Field id
    /// Type integer
    /// Atribute `primary key auto increment not null`
    final ddl = '''create table items 
        (id integer primary key autoincrement not null,
        name text,
        price int,
        quantity int);''';
    await database.execute(ddl).then((_) {
      debugPrint('Item table created succesfully');
    }, onError: (error) {
      debugPrint('Error while create item table');
    }).whenComplete(() => database.close());
  }
}
