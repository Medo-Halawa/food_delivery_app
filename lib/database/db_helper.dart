import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../Models/orderdata.dart';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._();

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'Halawa.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
      CREATE TABLE orders (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      total_price REAL,
      date TEXT,
      time TEXT
  )
    ''');
        await db.execute('''
      CREATE TABLE "OrderDetails" (
	"item_name"	TEXT,
	"item_num"	INTEGER,
	"item_price"	REAL,
	"order_id"	INTEGER
)
    ''');
        print("database created successfully----------------------------");
      },
    );
  }

  Future<List<Order>> getOrderHistory() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('orders');

    return List.generate(maps.length, (i) {
      return Order(
        id: maps[i]['id'],
        totalPrice: maps[i]['total_price'],
        date: maps[i]['date'],
        time: maps[i]['time'],
      );
    });
  }

  Future<int> insertOrder(Order order) async {
    final Database db = await database;
    return await db.insert(
      'orders',
      order.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<int> updateOrder(Order order) async {
    final Database db = await database;
    return await db.update(
      'orders',
      order.toMap(),
      where: 'id = ?',
      whereArgs: [order.id],
    );
  }

  Future<int> deleteOrder(int orderId) async {
    final Database db = await database;
    return await db.delete(
      'orders',
      where: 'id = ?',
      whereArgs: [orderId],
    );
  }
}
