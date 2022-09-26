// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GalleryStore on _GalleryStoreBase, Store {
  Computed<int>? _$counterImagesComputed;

  @override
  int get counterImages =>
      (_$counterImagesComputed ??= Computed<int>(() => super.counterImages,
              name: '_GalleryStoreBase.counterImages'))
          .value;

  late final _$imageCountAtom =
      Atom(name: '_GalleryStoreBase.imageCount', context: context);

  @override
  int get imageCount {
    _$imageCountAtom.reportRead();
    return super.imageCount;
  }

  @override
  set imageCount(int value) {
    _$imageCountAtom.reportWrite(value, super.imageCount, () {
      super.imageCount = value;
    });
  }

  late final _$imageUrlListAtom =
      Atom(name: '_GalleryStoreBase.imageUrlList', context: context);

  @override
  List<dynamic> get imageUrlList {
    _$imageUrlListAtom.reportRead();
    return super.imageUrlList;
  }

  @override
  set imageUrlList(List<dynamic> value) {
    _$imageUrlListAtom.reportWrite(value, super.imageUrlList, () {
      super.imageUrlList = value;
    });
  }

  late final _$_GalleryStoreBaseActionController =
      ActionController(name: '_GalleryStoreBase', context: context);

  @override
  void addImageToList(dynamic image) {
    final _$actionInfo = _$_GalleryStoreBaseActionController.startAction(
        name: '_GalleryStoreBase.addImageToList');
    try {
      return super.addImageToList(image);
    } finally {
      _$_GalleryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageCount: ${imageCount},
imageUrlList: ${imageUrlList},
counterImages: ${counterImages}
    ''';
  }
}
