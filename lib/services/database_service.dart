import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  Database? _database;

  factory DatabaseService() => _instance;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'airmind.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id TEXT PRIMARY KEY,
            name TEXT,
            email TEXT,
            profilePicture TEXT,
            preferences TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE air_quality_data (
            id TEXT PRIMARY KEY,
            location TEXT,
            aqi INTEGER,
            pm25 REAL,
            pm10 REAL,
            timestamp TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE climate_news (
            id TEXT PRIMARY KEY,
            title TEXT,
            content TEXT,
            imageUrl TEXT,
            publishedAt TEXT
          )
        ''');
      },
    );
  }

  Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> query(String table) async {
    final db = await database;
    return await db.query(table);
  }

  Future<int> delete(String table, String id) async {
    final db = await database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
