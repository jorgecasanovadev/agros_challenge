import 'package:shared_preferences/shared_preferences.dart';

class ClientSharedPreferences {
  static const String clientNameKey = 'client_name';

  static Future<String?> getClientName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(clientNameKey);
  }

  static setClientName(clientName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(clientNameKey, clientName);
  }

  static cleanClientName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(clientNameKey, '');
  }
}
