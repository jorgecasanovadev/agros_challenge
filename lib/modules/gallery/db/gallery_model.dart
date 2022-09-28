import 'package:agros_challenge/modules/gallery/db/table/gallery_database_table.dart';

class Gallery {
  late int? id;
  late String image;

  Gallery({
    required this.id,
    required this.image,
  });

  factory Gallery.fromMap(Map<String, dynamic> json) => Gallery(
      id: json[GalleryDatabaseTable.ID],
      image: json[GalleryDatabaseTable.IMAGE]);

  Map<String, dynamic> toMap() => {
        GalleryDatabaseTable.ID: id,
        GalleryDatabaseTable.IMAGE: image,
      };
}
