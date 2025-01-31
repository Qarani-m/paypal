import 'package:paypal/src/features/settings/models/messages_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'conversations.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create conversations table
    await db.execute('''
      CREATE TABLE conversations(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        time TEXT NOT NULL
      )
    ''');

    // Create messages table
    await db.execute('''
      CREATE TABLE messages(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        conversationId INTEGER NOT NULL,
        content TEXT NOT NULL,
        isFromSupport INTEGER NOT NULL,
        date TEXT NOT NULL,
        time TEXT NOT NULL,
        FOREIGN KEY (conversationId) REFERENCES conversations (id)
          ON DELETE CASCADE
      )
    ''');
  }

  // Insert a new conversation
  Future<int> insertConversation(Conversation conversation) async {
    final db = await database;
    return await db.insert(
      'conversations',
      conversation.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Insert a new message
  Future<int> insertMessage(int conversationId, Message message) async {
    final db = await database;
    return await db.insert(
      'messages',
      {
        ...message.toMap(),
        'conversationId': conversationId,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get all conversations with their messages
  Future<List<Conversation>> getConversations() async {
    final db = await database;
    
    // Get all conversations
    final List<Map<String, dynamic>> conversationMaps = await db.query('conversations');
    
    // For each conversation, get its messages
    List<Conversation> conversations = [];
    for (var conversationMap in conversationMaps) {
      final List<Map<String, dynamic>> messageMaps = await db.query(
        'messages',
        where: 'conversationId = ?',
        whereArgs: [conversationMap['id']],
      );
      
      final List<Message> messages = messageMaps
          .map((messageMap) => Message.fromMap(messageMap))
          .toList();
      
      conversations.add(Conversation.fromMap(conversationMap, messages));
    }
    
    return conversations;
  }

  // Get a single conversation with its messages
  Future<Conversation?> getConversation(int id) async {
    final db = await database;
    
    final List<Map<String, dynamic>> conversationMaps = await db.query(
      'conversations',
      where: 'id = ?',
      whereArgs: [id],
    );
    
    if (conversationMaps.isEmpty) return null;
    
    final List<Map<String, dynamic>> messageMaps = await db.query(
      'messages',
      where: 'conversationId = ?',
      whereArgs: [id],
    );
    
    final List<Message> messages = messageMaps
        .map((messageMap) => Message.fromMap(messageMap))
        .toList();
    
    return Conversation.fromMap(conversationMaps.first, messages);
  }

  // Delete a conversation and its messages
  Future<int> deleteConversation(int id) async {
    final db = await database;
    return await db.delete(
      'conversations',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete a specific message
  Future<int> deleteMessage(int messageId) async {
    final db = await database;
    return await db.delete(
      'messages',
      where: 'id = ?',
      whereArgs: [messageId],
    );
  }

  // Get messages for a specific conversation
  Future<List<Message>> getMessagesForConversation(int conversationId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'messages',
      where: 'conversationId = ?',
      whereArgs: [conversationId],
    );
    
    return List.generate(maps.length, (i) => Message.fromMap(maps[i]));
  }
}



              