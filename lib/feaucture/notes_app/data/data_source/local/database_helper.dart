import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabesHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    String fullPath = join(path, 'note_database.db');
    return openDatabase(
      fullPath,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, noteTitle TEXT, noteContent TEXT, addTime INTEGER)',
        );
      },
      version: 1,
    );
  }
}

// notesonCreate(Database db , int version){
// return db.execute(
// create table note(id primary key autoucomplete, noteTitle text, noteContent text, addTime dataTime )
// )
