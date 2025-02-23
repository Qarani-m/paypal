import 'package:path/path.dart';
import 'package:paypal/src/features/home/models/contacts_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperContact {
  static Database? _database;
  
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            hasImage BOOLEAN NOT NULL,
            imageUrl TEXT
          )
        ''');
      }
    );
  }

Future<void> insertUser(ContactModel contact) async {
    final db = await database;
    await db.insert(
      'users',
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }




  // Method to get first 3 items
 Future<List<ContactModel>> getFirstThreeUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      limit: 3,
      orderBy: 'id DESC',
    );

    return maps.map((map) => ContactModel.fromMap(map)).toList();
  }

Future<ContactModel?> getUserById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    
    if (maps.isEmpty) return null;
    return ContactModel.fromMap(maps.first);
  }
Future<void> deleteUserById(int id) async {
  final db = await database;
  
  try {
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  } catch (e) {
    print('Error deleting user: $e');
  }
}

}














































// ChatBubble(
                                    // message:
                                        // "If I can't then I'll try to transfer you to a Customer Support Agent.",
                                    // isUser: false,
                                  // );




//  Center(
//                                         child: Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               vertical: 8.h),
//                                           child: Text(
//                                             'Jan 22 at 08:32 pm',
//                                             style: TextStyle(
//                                               fontSize: 7.5.sp,
//                                               color:
//                                                   Colors.black.withOpacity(0.6),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       ChatBubble(
//                                         message:
//                                             "Hi! I'm your PayPal Assistant and always here to help. I'm still in beta testing, so talking to you helps me learn.",
//                                         isUser: false,
//                                       ),