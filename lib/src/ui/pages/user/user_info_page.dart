import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:echnelapp/src/data/services/services.dart';
import '../../widgets/widgets.dart';
import 'package:echnelapp/src/ui/pages/pages.dart';

class UserInfoPage extends StatefulWidget {
  UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => UserInfoPageState();
}

class UserInfoPageState extends State<UserInfoPage> {
  final ViajesService viajesService = new ViajesService();
  @override
  Widget build(BuildContext context) {
    final viajesService = Provider.of<ViajesService>(context, listen: true);
    if (viajesService.isLoading) return LoadingUsrPage();
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: Text('Viajes'),
      ),
      body: ListView.builder(
          itemCount: viajesService.viajes.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                child: ViajeCardUser(
                  viaje: viajesService.viajes[index],
                ),
                onTap: () {
                  viajesService.selectedViaje = viajesService.viajes[index];
                  Navigator.pushNamed(context, 'viaje');
                },
              )),

      // floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.add),
      //     onPressed: () {
      //       viajesService.selectedViaje =
      //           new Viaje(available: false, name: '', salida: '');
      //       Navigator.pushNamed(context, 'viaje');
      //     }),
    );
  }
}
