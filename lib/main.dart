import 'package:agros_challenge/app.dart';
import 'package:agros_challenge/modules/gallery/stores/gallery_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<GalleryStore>(create: (_) => GalleryStore()),
    ],
    child: const App(),
  ));
}
