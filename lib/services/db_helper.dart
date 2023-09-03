import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/avaliacao.dart';

class DatabaseHelper {
  static final _dbName = 'avaliacoes.db';
  static final _dbVersion = 2;
  static final _tableName = 'avaliacoes';

  static final columnId = 'id';
  static final columnName = 'nomeMotorista';
  static final columfotoUrlMotorista = 'fotoUrlMotorista';
  static final columnRating = 'rating';
  static final columnComentario = 'comentario';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(path,
        version: _dbVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        $columnId INTEGER PRIMARY KEY,
        $columnName TEXT NOT NULL,
        $columfotoUrlMotorista TEXT NOT NULL,
        $columnRating REAL NOT NULL,
        $columnComentario TEXT NOT NULL
      )
    ''');
  }

  Future<int> insert(Avaliacao avaliacao) async {
    Database db = await database;
    int id = await db.insert(_tableName, avaliacao.toMap());
    return id;
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE $_tableName ADD $columfotoUrlMotorista TEXT');
    }
  }


  Future<List<Avaliacao>> queryAllRows() async {
    Database db = await database;
    var res = await db.query(_tableName);
    List<Avaliacao> list =
    res.isNotEmpty ? res.map((c) => Avaliacao.fromMap(c)).toList() : [];
    return list;
  }
}
