import 'dart:io';

class Environment {
  static const String API_URL = "http://localhost:8080/";

  static String apiUrl =
      Platform.isAndroid ? 'http://10.0.2.2:8080/' : 'http://127.0.0.1:8080/';

  static String socketUrl =
      Platform.isAndroid ? 'http://localhost:8080/' : 'http://127.0.0.1:8080/';
}
