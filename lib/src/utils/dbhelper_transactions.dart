import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;
  static const String TABLE = 'transactions';
  static const String DB_NAME = 'payments.db';

  // Database initialization
  Future<Database> get db async => _db ??= await initDb();

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), DB_NAME);
    return await openDatabase(
      path,
      version: 9,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  // Table operations
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $TABLE (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        message TEXT,
        currency TEXT NOT NULL,
        amount TEXT NOT NULL,
        transactionCode TEXT NOT NULL,
        date TEXT NOT NULL,
        time TEXT NOT NULL,
        email TEXT,
        exchangeRate TEXT,
        type TEXT,
        payPalFee TEXT,
        direction TEXT,
        hasProfilePic INTEGER NOT NULL,
        imagePath TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('DROP TABLE IF EXISTS $TABLE');
    await _onCreate(db, newVersion);
  }

  // CRUD operations
  Future<Map<String, dynamic>?> insertOne(Map<String, dynamic> row) async {
    final dbClient = await db;
    int id = await dbClient.insert(TABLE, row);
    return id > 0 ? await readById(id) : null;
  }

  Future<List<int>> insertMany(List<Map<String, dynamic>> rows) async {
    final dbClient = await db;
    List<int> ids = [];
    await dbClient.transaction((txn) async {
      for (var row in rows) {
        ids.add(await txn.insert(TABLE, row));
      }
    });
    return ids;
  }

  Future<List<Map<String, dynamic>>> readAll() async {
    final dbClient = await db;
    return await dbClient.query(TABLE, orderBy: 'created_at DESC');
  }

  Future<Map<String, dynamic>?> readById(int id) async {
    final dbClient = await db;
    var result = await dbClient.query(
      TABLE,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }

Future<List<Map<String, dynamic>>> getLastThreeTransactions() async {
  final dbClient = await db;
  return await dbClient.query(
    TABLE,
    orderBy: 'date DESC, time DESC',
    limit: 10,
  );
}

  Future<int> update(int id, Map<String, dynamic> row) async {
    final dbClient = await db;
    return await dbClient.update(
      TABLE,
      row,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteOne(int id) async {
    final dbClient = await db;
    return await dbClient.delete(
      TABLE,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteMany(List<int> ids) async {
    final dbClient = await db;
    return await dbClient.delete(
      TABLE,
      where: 'id IN (${List.filled(ids.length, '?').join(',')})',
      whereArgs: ids,
    );
  }

  Future<int> deleteAllTransactions() async {
    final dbClient = await db;
    return await dbClient.delete(TABLE);
  }
}