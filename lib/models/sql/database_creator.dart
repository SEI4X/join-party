import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

Database db;

class DatabaseCreator {
  static const String table = "profile";
  static const String id = "id";
  static const String firstName = "firstName";
  static const String secondName = "secondName";
  static const String login = "login";
  static const String imageUrl = "imageUrl";
  static const String colorScheme = "colorScheme";
  static const String country = "country";
  static const String city = "city";
  static const String tikTok = "tikTok";
  static const String vk = "vk";
  static const String inst = "inst";
  static const String twitter = "twitter";
  static const String about = "about";

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateQueryResult,
      List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createTable(Database db) async {
    final sql = '''CREATE TABLE $table(
      $id INTEGER PRIMARY KEY,
	    $firstName TEXT,
	    $secondName TEXT,
	    $imageUrl TEXT,
	    $colorScheme INTEGER,
	    $country TEXT,
	    $city TEXT,
	    $tikTok TEXT,
	    $vk TEXT,
	    $inst TEXT,
      $twitter TEXT,
	    $about TEXT,
      $login TEXT)''';
    await db.execute(sql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('profile_db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createTable(db);
  }
}
