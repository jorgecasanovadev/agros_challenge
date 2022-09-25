import 'package:agros_challenge/components/shared/client_preferences.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _userName = '';
  void getClientName() async {
    ClientSharedPreferences.getClientName().then((value) {
      setState(() => _userName = value!);
    });
  }

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
        title: Text("Bienvenido $_userName"),
      ),
      body: const Center(
        child: Text('Agros Home'),
      ),
    );
  }
}
