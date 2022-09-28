import 'package:agros_challenge/modules/gallery/db/table/gallery_database_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static const String dbName = 'agrosDB.db';
  static int currentVersion = 1;

  DatabaseProvider._privateConstructor();
  static final DatabaseProvider dbInstance =
      DatabaseProvider._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await create();
    return _database;
  }

  Future<Database> create() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    var db = await openDatabase(
      path,
      version: currentVersion,
      onConfigure: _onConfigure,
      onCreate: _onCreate,
      onOpen: _onOpen,
      onDowngrade: onDatabaseDowngradeDelete,
    );
    return db;
  }

  _onOpen(Database db) async {}

  _onCreate(Database db, int version) async {
    var batch = db.batch();
    // gallery
    GalleryDatabaseTable.create(batch);
    await batch.commit();
  }

  _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
}
