import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import '../../ui/driver_routes.dart';

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
      // * QUEDA POR HACER LA REDIRECCION DEPENDIENDO DE EL ROL DE USUARIO QUE TENGA
      // ! SELECCIONAR DESDE EL LOCALSTORAGE EL ROL QUE FUE GUARDADO
      //body: AdminRoutes(index: index),
      // body: DriverRoutes(index: index),
      body: DriverRoutes(index: index),
    );
  }
}
