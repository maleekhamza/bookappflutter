import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'Book.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'bookatabase.db'),
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE books(id INTEGER PRIMARY KEY, Name TEXT, Price TEXT,UrlAvatar TEXT, Description TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertbook(Book book) async {
    final db = await initializeDB();
    await db.insert(
      'books',
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Book>> books() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('books');
    return queryResult.map((e) => Book.fromMap(e)).toList();
  }

  Future<void> deletebook(int id) async {
    final db = await initializeDB();
    await db.delete(
      'books',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}