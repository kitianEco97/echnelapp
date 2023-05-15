import 'package:flutter/material.dart';
import 'package:echnelapp/src/ui/pages/pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'loading': (context) => LoadingPage(),
  // ignore: todo
  // TODO * ADMIN
  'admin/home': (context) => HomeAdminMainPage(),
  'admin/info': (context) => AdminGetTripPage(),
  'admin/map': (context) => AdminMapPage(),
  'admin/trip': (context) => AdminCreateTripPage(),
  'admin/trip/update': (context) => AdminUpdateTripPage(),

  // ? USER
  'user/home': (context) => UserHomeMainPage(),
  'user/info': (context) => UserGetTripPage(),
  'user/trip': (context) => UserGetTripPage(),
  'user/map': (context) => UserMapPage(),
  'user/trip/detail': (context) => UserTripDetailPage(trip: null),

  // ! DRIVER
  'driver/home': (context) => DriverHomePage(),
  'driver/info': (context) => DriverGetTripPage(),
  'driver/trip': (context) => DriverGetTripPage(),
  'driver/map': (context) => DriverMapPage(),
  'driver/trip/detail': (context) => DriverTripDetailPage(trip: null),

  'login': (context) => LoginPage(),
  'register': (context) => RegisterPage(),
};
