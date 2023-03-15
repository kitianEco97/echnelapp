import 'package:flutter/material.dart';
import 'package:echnelapp/src/ui/pages/pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'loading': (context) => LoadingPage(),
  'admin/home': (context) => HomeAdminMainPage(),
  'admin/tutorial': (context) => AdminTutorialPage(),
  'user/home': (context) => UserHomeMainPage(),
  'user/tut': (context) => UserTutorialPage(),
  'driver/home': (context) => DriverHomeMainPage(),
  'viaje': (context) => AdminViajePage(),
  'login': (context) => LoginPage(),
  'register': (context) => RegisterPage(),
  'status': (context) => StatusPage(),
  'chat': (context) => UserChatPage(),
};
