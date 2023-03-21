import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:echnelapp/src/ui/pages/user/user_prev_home_page_controller.dart';

import '../../widgets/widgets.dart';

class UserHomeMainPage extends StatefulWidget {
  const UserHomeMainPage({Key key}) : super(key: key);

  @override
  State<UserHomeMainPage> createState() => _UserHomeMainPageState();
}

BuildContext context;

class _UserHomeMainPageState extends State<UserHomeMainPage> {
  UserPrevHomePageController _con = new UserPrevHomePageController();

  int index = 0;
  ButtomNavBarEch myBNB;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: MenuDrawer(),
      ),
      drawer: DrawerUsr(),
      body: Center(
        child: Text('USER MAIN HOME PAGE'),
      ),
      // body: UserRoutes(index: index),
    );
  }
}
