import 'package:agros_challenge/components/theme/inputs_theme.dart';
import 'package:agros_challenge/components/views/image_components.dart';
import 'package:agros_challenge/modules/gallery/stores/gallery_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final galleryStore = context.read<GalleryStore>();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios, size: 26),
          onTap: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Galeria",
          style: InputTheme.labelTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
        ),
        children: List<Widget>.generate(
          galleryStore.imageUrlList.length,
          (index) {
            return imageToGallery(context, galleryStore.imageUrlList[index]);
          },
        ),
      ),
    );
  }
}
