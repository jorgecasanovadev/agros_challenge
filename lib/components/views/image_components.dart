import 'package:agros_challenge/components/theme/color_theme.dart';
import 'package:agros_challenge/modules/gallery/stores/gallery_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

GestureDetector imageSlider(BuildContext context, String item) {
  final galleryStore = Provider.of<GalleryStore>(context);

  return GestureDetector(
    child: Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              item,
              fit: BoxFit.cover,
              width: 100,
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                width: 100,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(106, 0, 0, 0),
                      Color.fromARGB(27, 0, 0, 0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'N° ${galleryStore.imageUrlList.indexOf(item) + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) {
            return Scaffold(
              backgroundColor: ColorTheme.primaryColor,
              body: GestureDetector(
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: Hero(
                      tag: 'Image',
                      child: Image.network(
                        item,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                onTap: () => Navigator.pop(context),
              ),
            );
          },
        ),
      );
    },
  );
}

Container imageShow(
    BuildContext context, String item, void Function()? function) {
  return Container(
    padding: const EdgeInsets.only(top: 16.0),
    child: Card(
      elevation: 10.0,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Stack(
          children: [
            Image.network(
              item,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(106, 0, 0, 0),
                      Color.fromARGB(27, 0, 0, 0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: GestureDetector(
                  child: const Icon(
                    Icons.delete_rounded,
                    size: 20.0,
                    color: Colors.white,
                  ),
                  onTap: function,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

GestureDetector imageToGallery(BuildContext context, String item) {
  final galleryStore = Provider.of<GalleryStore>(context);

  return GestureDetector(
    child: Container(
      margin: const EdgeInsets.all(5.0),
      child: Stack(
        children: <Widget>[
          Image.network(item,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),
          Positioned(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(106, 0, 0, 0),
                    Color.fromARGB(27, 0, 0, 0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'N° ${galleryStore.imageUrlList.indexOf(item) + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) {
            return Scaffold(
              backgroundColor: ColorTheme.primaryColor,
              body: GestureDetector(
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: Hero(
                      tag: 'Image',
                      child: Image.network(
                        item,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                onTap: () => Navigator.pop(context),
              ),
            );
          },
        ),
      );
    },
  );
}
