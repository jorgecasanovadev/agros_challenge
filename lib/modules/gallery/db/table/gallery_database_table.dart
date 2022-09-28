import 'package:sqflite/sqlite_api.dart';

class GalleryDatabaseTable {
  static const String TABLE_NAME = 'gallery';

  static const String ID = 'id';
  static const String IMAGE = 'image';

  static void create(Batch batch) {
    batch.execute("DROP TABLE IF EXITS $TABLE_NAME");
    batch.execute("CREATE TABLE $TABLE_NAME ("
        "$ID INTEGER PRIMARY KEY,"
        "$IMAGE IMAGE");
  }
}
