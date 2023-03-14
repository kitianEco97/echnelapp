import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import '../../../ui/routes/driver_routes.dart';

class DriverHomeMainPage extends StatefulWidget {
  const DriverHomeMainPage({Key? key}) : super(key: key);

  @override
  State<DriverHomeMainPage> createState() => _DriverHomeMainPageState();
}

class _DriverHomeMainPageState extends State<DriverHomeMainPage> {
  int index = 0;
  ButtomNavBarEch? myBNB;

  @override
  void initState() {
    myBNB = ButtomNavBarEch(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myBNB,
      body: DriverRoutes(index: index),
    );
  }
}
