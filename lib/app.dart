import 'dart:async';

import 'package:agros_challenge/components/theme/color_theme.dart';
import 'package:agros_challenge/components/views/fade_router.dart';
import 'package:agros_challenge/modules/authentication/views/login_screen.dart';
import 'package:agros_challenge/modules/gallery/views/gallery_screen.dart';
import 'package:agros_challenge/modules/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Agros Challenge",
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: ColorTheme.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorTheme.primaryColor,
          secondary: ColorTheme.secondaryColor,
        ),
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/init':
            return FadeRouter(page: const Init(title: 'Agros'));
          case '/login':
            return FadeRouter(page: const LoginScreen());
          case '/home':
            return FadeRouter(page: const HomeScreen());
          case '/gallery':
            return FadeRouter(page: const GalleryScreen());
        }
        return null;
      },
      initialRoute: '/init',
    );
  }
}

class Init extends StatefulWidget {
  final String title;
  const Init({Key? key, required this.title}) : super(key: key);

  @override
  State<Init> createState() => _InitState();
}

class _InitState extends State<Init> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () => Navigator.of(context).pushReplacementNamed('/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _InitBody(),
    );
  }
}

class _InitBody extends StatefulWidget {
  const _InitBody({Key? key}) : super(key: key);

  @override
  State<_InitBody> createState() => __InitBodyState();
}

class __InitBodyState extends State<_InitBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(decoration: const BoxDecoration(color: Colors.white)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_agros.png',
                    width: 300,
                    height: 300,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Text(
                    'Cargando',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
