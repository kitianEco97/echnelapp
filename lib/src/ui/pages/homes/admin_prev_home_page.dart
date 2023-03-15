import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:echnelapp/src/data/services/services.dart';
import '../../widgets/widgets.dart';
import '../../../ui/routes/admin_routes.dart';

class HomeAdminMainPage extends StatefulWidget {
  const HomeAdminMainPage({Key? key}) : super(key: key);

  @override
  State<HomeAdminMainPage> createState() => _HomeAdminMainPageState();
}

class _HomeAdminMainPageState extends State<HomeAdminMainPage> {
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
  void dispose() {
    // final socketService = Provider.of<SocketService>(context, listen: false);
    // socketService.socket.off('viajes-activos');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myBNB,
      body: AdminRoutes(index: index),
    );
  }
}
