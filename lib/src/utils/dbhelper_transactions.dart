import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
 static Database? _db;
 static const String TABLE = 'transactions';
 static const String DB_NAME = 'payments.db';

 Future<Database> get db async {
   if (_db != null) return _db!;
   _db = await initDb();
   return _db!;
 }

 initDb() async {
   String path = join(await getDatabasesPath(), DB_NAME);
   return await openDatabase(path, version: 3, onCreate: _onCreate);
 }

 _onCreate(Database db, int version) async {
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
       hasProfilePic INTEGER NOT NULL
     )
   ''');
 }

 Future<int> insertOne(Map<String, dynamic> row) async {
   Database dbClient = await db;
   return await dbClient.insert(TABLE, row);
 }

 Future<List<int>> insertMany(List<Map<String, dynamic>> rows) async {
   Database dbClient = await db;
   List<int> ids = [];
   await dbClient.transaction((txn) async {
     for (var row in rows) {
       ids.add(await txn.insert(TABLE, row));
     }
   });
   return ids;
 }

 Future<int> deleteOne(int id) async {
   Database dbClient = await db;
   return await dbClient.delete(TABLE, where: 'id = ?', whereArgs: [id]);
 }

 Future<int> deleteMany(List<int> ids) async {
   Database dbClient = await db;
   return await dbClient.delete(TABLE, where: 'id IN (${ids.join(',')})',);
 }

 Future<Map<String, dynamic>?> readById(int id) async {
   Database dbClient = await db;
   List<Map<String, dynamic>> result = await dbClient.query(TABLE,
       where: 'id = ?', whereArgs: [id], limit: 1);
   return result.isNotEmpty ? result.first : null;
 }

 Future<List<Map<String, dynamic>>> readAll() async {
   Database dbClient = await db;
   return await dbClient.query(TABLE);
 }

 Future<int> update(int id, Map<String, dynamic> row) async {
   Database dbClient = await db;
   return await dbClient.update(TABLE, row,
       where: 'id = ?', whereArgs: [id]);
 }
}