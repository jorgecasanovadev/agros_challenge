import 'package:agros_challenge/components/shared/client_preferences.dart';
import 'package:agros_challenge/components/theme/btn_theme.dart';
import 'package:agros_challenge/components/theme/color_theme.dart';
import 'package:agros_challenge/components/theme/inputs_theme.dart';
import 'package:agros_challenge/components/views/image_components.dart';
import 'package:agros_challenge/components/views/spinner_loader.dart';
import 'package:agros_challenge/modules/gallery/stores/gallery_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  String _username = '';

  bool _isLoading = false;

  @override
  void initState() {
    getClientName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.maps_home_work, size: 36),
        title: Text("Bienvenido $_username"),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Form(
                key: _homeKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Column(
                    children: <Widget>[
                      buildCounterField(context),
                      buildSearchField(context),
                      formSeparator(),
                      SizedBox(
                        width: double.infinity,
                        child: buildSearchButton(context),
                      ),
                      const Divider(thickness: 2.0),
                      SizedBox(
                        width: double.infinity,
                        child: buildGalleryButton(context),
                      ),
                      const Divider(thickness: 2.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _isLoading,
            child: const Center(child: SpinnerLoader()),
          ),
          Observer(
            builder: (_) => Container(
              padding: const EdgeInsets.only(top: 250),
              child: SingleChildBuilder(
                builder: ((context, child) =>
                    buildVerticalScrollImages(context)),
              ),
            ),
          ),
          Observer(
            builder: (_) => buildHorizontalScrollImages(context),
          ),
        ],
      ),
    );
  }

  buildCounterField(BuildContext context) {
    final galleryStore = context.read<GalleryStore>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Text(
        'Imagenes restantes: ${5 - galleryStore.imageCount}',
        style: InputTheme.labelTextStyle.copyWith(
          color: ColorTheme.secondaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  buildSearchField(BuildContext context) {
    return TextFormField(
      controller: _urlController,
      validator: (urlInput) {
        if (urlInput == null || urlInput.isEmpty) {
          return "Debe ingresar una url";
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Ingresar URL',
        labelStyle: InputTheme.labelTextStyle,
      ),
      style: InputTheme.inputTextStyle,
      keyboardType: TextInputType.text,
    );
  }

  buildSearchButton(BuildContext context) {
    final galleryStore = context.read<GalleryStore>();
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: ColorTheme.primaryColor,
      padding: BtnTheme.btnPadding,
      shape: BtnTheme.btnShape,
    );
    return TextButton(
      style: flatButtonStyle,
      child: Text("Cargar Imagen", style: BtnPrimaryTheme.btnTextStyle),
      onPressed: (galleryStore.imageCount == 5)
          ? null
          : () {
              if (_homeKey.currentState!.validate()) {
                setState(() => _isLoading = true);
                fetchFromPictureURL(context, _urlController.text);
                setState(() => _isLoading = false);
              }
            },
    );
  }

  buildGalleryButton(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: ColorTheme.secondaryColor.withOpacity(0.6),
      padding: BtnTheme.btnPadding,
      shape: BtnTheme.btnShape,
    );
    return TextButton(
      style: flatButtonStyle,
      child: Text("Galleria", style: BtnPrimaryTheme.btnTextStyle),
      onPressed: () => Navigator.of(context).pushNamed('/gallery'),
    );
  }

  formSeparator() {
    return const SizedBox(height: 15.0);
  }

  void getClientName() async {
    ClientSharedPreferences.getClientName().then((value) {
      setState(() => _username = value!);
    });
  }

  fetchFromPictureURL(BuildContext context, String url) {
    final galleryStore = context.read<GalleryStore>();
    galleryStore.addImageToList(url);
    galleryStore.counterImages;
  }

  buildVerticalScrollImages(BuildContext context) {
    final galleryStore = context.watch<GalleryStore>();
    return Center(
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: galleryStore.imageUrlList.length,
        itemBuilder: (BuildContext context, int index) {
          return imageShow(context, galleryStore.imageUrlList[index], () {
            setState(() => galleryStore.deleteImageFromList(index));
          });
        },
      ),
    );
  }

  buildHorizontalScrollImages(BuildContext context) {
    final galleryStore = context.watch<GalleryStore>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: ColorTheme.primaryColor.withOpacity(0.4),
          child: SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8.0),
              itemCount: galleryStore.imageUrlList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 10.0);
              },
              itemBuilder: (BuildContext context, int index) {
                return imageSlider(context, galleryStore.imageUrlList[index]);
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
