import 'package:agros_challenge/components/db/database_provider.dart';
import 'package:agros_challenge/modules/gallery/db/gallery_model.dart';
import 'package:agros_challenge/modules/gallery/db/table/gallery_database_table.dart';
import 'package:sqflite/sqflite.dart';

class GalleryDatabase {
  static Future<Database?> database = DatabaseProvider.dbInstance.database;

  static Future<Gallery> insert(Gallery image) async {
    final Database? db = await database;
    print('insert database function');
    print(image.id);
    image.id = await db!.insert(
      GalleryDatabaseTable.TABLE_NAME,
      {
        GalleryDatabaseTable.ID: image.id,
        GalleryDatabaseTable.IMAGE: image.image
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return image;
  }

  static Future<int?> delete(int id) async {
    final Database? db = await database;
    print('delete database function');
    print(id);

    return await db!.delete(
      GalleryDatabaseTable.TABLE_NAME,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  static Future<List<Gallery>> getImages() async {
    final Database? db = await database;

    List<Map> images = await db!.query(
      GalleryDatabaseTable.TABLE_NAME,
      columns: [
        GalleryDatabaseTable.ID,
        GalleryDatabaseTable.IMAGE,
      ],
    );

    List<Gallery> imageList = [];
    if (images.isNotEmpty) {
      for (var img in images) {
        imageList.add(Gallery.fromMap(Map<String, dynamic>.from(img)));
      }
    }

    print('getImages database function');
    print("photos {{$imageList}}");
    return imageList;
  }

  static Future close() async {
    final Database? db = await database;
    db!.close();
  }
}
