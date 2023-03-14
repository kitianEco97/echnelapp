import 'package:echnelapp/src/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class AdminRoutes extends StatelessWidget {
  final int index;

  const AdminRoutes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> driverPages = [
      AdminHomePage(),
      AdminViajesPage(),
      AdminMapPage(),
      AdminTutorialPage(),
      AdminSessionPage()
    ];
    return driverPages[index];
  }
}
