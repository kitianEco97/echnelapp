import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:echnelapp/src/ui/pages/admin/admin_prev_home_page_controller.dart';

import '../../widgets/widgets.dart';

class HomeAdminMainPage extends StatefulWidget {
  const HomeAdminMainPage({Key key}) : super(key: key);

  @override
  State<HomeAdminMainPage> createState() => _HomeAdminMainPageState();
}

BuildContext context;

class _HomeAdminMainPageState extends State<HomeAdminMainPage> {
  AdminPrevHomeController _con = new AdminPrevHomeController();

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
        // leading: MenuDrawer(),
      ),
      // drawer: DrawerUsr(),
      body: Center(
        child: Text('ADMIN MAIN HOME PAGE'),
      ),
      // body: UserRoutes(index: index),
    );
  }
}
