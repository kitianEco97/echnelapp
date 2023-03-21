import 'dart:io';

class Environment {
  static const String API_URL = "http://localhost:3000/";

  static String apiUrl = Platform.isAndroid
      ? 'http://localhost:3000/api'
      : 'http://127.0.0.1:3000/api';

  static String socketUrl =
      Platform.isAndroid ? 'http://localhost:3000/' : 'http://127.0.0.1:3000/';
}
