import 'package:flutter/material.dart';
import 'package:echnelapp/src/ui/pages/pages.dart';

class UserRoutes extends StatefulWidget {
  final int index;

  const UserRoutes({Key? key, required this.index}) : super(key: key);

  @override
  State<UserRoutes> createState() => _UserRoutesState();
}

class _UserRoutesState extends State<UserRoutes> {
  @override
  Widget build(BuildContext context) {
    List<Widget> userPages = [
      UserHomePage(),
      UserInfoPage(),
      UserMapPage(),
      UserTutorialPage(),
      UserSessionPage()
    ];
    return userPages[widget.index];
  }
}
