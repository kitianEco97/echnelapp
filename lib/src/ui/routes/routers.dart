import 'package:flutter/material.dart';
import 'package:echnelapp/src/ui/pages/admin/admin_prev_home_page.dart';
import 'package:echnelapp/src/ui/pages/pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'loading': (context) => LoadingPage(),
  // ignore: todo
  // TODO * ADMIN
  'admin/home': (context) => HomeAdminMainPage(),
  'admin/tutorial': (context) => AdminTutorialPage(),
  // ? USER
  'user/home': (context) => UserHomeMainPage(),
  'user/info': (context) => UserInfoPage(),
  'user/map': (context) => UserMapPage(),
  'chat': (context) => UserChatPage(),
  // ! DRIVER
  'driver/home': (context) => DriverHomeMainPage(),
  'login': (context) => LoginPage(),
  'register': (context) => RegisterPage(),
  'status': (context) => StatusPage(),
};
