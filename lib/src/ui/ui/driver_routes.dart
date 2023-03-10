import 'package:echnelapp/src/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class DriverRoutes extends StatelessWidget {
  final int index;

  const DriverRoutes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> driverPages = [
      DriverHomePage(),
      DriverInfoPage(),
      DriverMapPage(),
      DriverTutorialPage(),
      DriverSessionPage()
    ];
    return driverPages[index];
  }
}
