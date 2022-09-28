import 'package:mobx/mobx.dart';
part 'gallery_store.g.dart';

class GalleryStore = _GalleryStoreBase with _$GalleryStore;

abstract class _GalleryStoreBase with Store {
  @observable
  int imageCount = 0;

  @observable
  List imageUrlList = <String>[];

  @computed
  int get counterImages => ++imageCount;

  @action
  void addImageToList(image) {
    imageUrlList.add(image);
  }

  @action
  void deleteImageFromList(index) {
    imageUrlList.removeAt(index);
    --imageCount;
  }
}
