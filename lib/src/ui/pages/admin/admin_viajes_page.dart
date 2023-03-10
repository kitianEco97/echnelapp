import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:echnelapp/src/data/services/services.dart';
import '../../widgets/widgets.dart';
import 'package:echnelapp/src/data/models/models.dart';
import 'package:echnelapp/src/ui/pages/pages.dart';

class AdminViajesPage extends StatefulWidget {
  const AdminViajesPage({Key? key}) : super(key: key);

  @override
  State<AdminViajesPage> createState() => _AdminViajesPageState();
}

class _AdminViajesPageState extends State<AdminViajesPage> {
  @override
  Widget build(BuildContext context) {
    final viajesService = Provider.of<ViajesService>(context);

    if (viajesService.isLoading) return LoadingUsrPage();

    return Scaffold(
      appBar: AppBar(
        title: Text('Viajes'),
      ),
      body: ListView.builder(
          itemCount: viajesService.viajes.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                child: ViajeCard(
                  viaje: viajesService.viajes[index],
                ),
                onTap: () {
                  viajesService.selectedViaje =
                      viajesService.viajes[index].copy();
                  Navigator.pushNamed(context, 'viaje');
                },
              )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            viajesService.selectedViaje =
                new Viaje(available: false, name: '', salida: '');
            Navigator.pushNamed(context, 'viaje');
          }),
    );
  }
}
