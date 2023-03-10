import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import '../../ui/user_routes.dart';

class UserHomeMainPage extends StatefulWidget {
  const UserHomeMainPage({Key? key}) : super(key: key);

  @override
  State<UserHomeMainPage> createState() => _UserHomeMainPageState();
}

class _UserHomeMainPageState extends State<UserHomeMainPage> {
  late BuildContext context;

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
      //body: AdminRoutes(index: index),
      // body: DriverRoutes(index: index),
      body: UserRoutes(index: index),
    );
  }
}
