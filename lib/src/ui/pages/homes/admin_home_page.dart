import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import '../../ui/admin_routes.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myBNB,
      // * QUEDA POR HACER LA REDIRECCION DEPENDIENDO DE EL ROL DE USUARIO QUE SE TENGA
      // ! SELECCIONAR DESDE EL LOCALSTORAGE EL ROL QUE FUE GUARDADO
      //body: AdminRoutes(index: index),
      // body: DriverRoutes(index: index),
      body: AdminRoutes(index: index),
    );
  }
}
