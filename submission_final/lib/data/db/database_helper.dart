
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;
 
  DatabaseHelper._internal() {
    _instance = this;
  }
 
  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();
 
  static const String _tblFavorite = 'favorite';
 
  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/restaurant.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblFavorite (
             id TEXT PRIMARY KEY,
             name TEXT,
             description TEXT,
             city TEXT,
             address TEXT,
             pictureId TEXT,
             content TEXT
           )
        ''');
      },
      version: 1,
    );
 
    return db;
  }
 
  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initializeDb();
    }
 
    return _database;
  }
}