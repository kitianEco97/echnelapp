import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:echnelapp/src/data/models/models.dart';
import 'package:provider/provider.dart';

import '../../../data/services/services.dart';

class AdminTutorialPage extends StatefulWidget {
  const AdminTutorialPage({Key key}) : super(key: key);

  @override
  State<AdminTutorialPage> createState() => _AdminTutorialPageState();
}

class _AdminTutorialPageState extends State<AdminTutorialPage> {
  List<Trip> trips = [];
  @override
  void initState() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.on('viajes-activos', _handleActiveTrips);
    super.initState();
  }

  _handleActiveTrips(dynamic payload) {
    trips = (payload as List).map((band) => Trip.fromMap(band)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('Viajes',
            style: TextStyle(
                color: Colors.black87,
                backgroundColor: Colors.lightGreenAccent.shade700)),
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, i) => _tripTile(trips[i]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: addNewViaje,
      ),
    );
  }

  Widget _tripTile(Trip trip) {
    // setState(() {});
    final socketService = Provider.of<SocketService>(context);
    return Dismissible(
      key: Key(trip.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (_) => socketService.emit('delete-trip', {'id': trip.id}),
      background: Container(
        padding: EdgeInsets.only(left: 10),
        color: Colors.red,
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Viaje Eliminado',
              style: TextStyle(color: Colors.white),
            )),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(trip.nombre.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(trip.nombre),
        trailing: Text(
          '${trip.salida}',
          style: TextStyle(fontSize: 20),
        ),
        //? DE ESTA FORMA SE PUEDE EMITIR LA UBICACION DEL CONDUCTOR
        onTap: () => socketService.socket.emit('vote-trip', {'id': trip.id}),
      ),
    );
  }

  addNewViaje() {
    final textNombreController = new TextEditingController();
    final textSalidaController = new TextEditingController();

    if (Platform.isAndroid) {
      //* ANDROID
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Nuevo Viaje'),
                content: Container(
                  height: 300,
                  child: Column(
                    children: [
                      Text('nombre', style: TextStyle()),
                      TextField(controller: textNombreController),
                      SizedBox(height: 5),
                      Text('salidas', style: TextStyle()),
                      TextField(
                        controller: textSalidaController,
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                actions: <Widget>[
                  MaterialButton(
                      child: Text('Agregar'),
                      onPressed: () => addViajeToList(
                            textNombreController.text,
                            textSalidaController.text,
                            // textVotesController.text as int
                          ))
                ],
              ));
    }

    showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Text('Nuevo viaje'),
              content: Container(
                child: Column(
                  children: [
                    Text('nombre', style: TextStyle()),
                    CupertinoTextField(
                      controller: textNombreController,
                    ),
                    SizedBox(height: 5),
                    Text('salidas', style: TextStyle()),
                    CupertinoTextField(
                      controller: textSalidaController,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('Agregar'),
                    onPressed: () {
                      addViajeToList(
                        textNombreController.text,
                        textSalidaController.text,
                        // textVotesController.text as int
                      );
                      // print(
                      // '${textNombreController.text + textSalidaController.text}');
                    }),
                CupertinoDialogAction(
                    isDestructiveAction: true,
                    child: Text('Cancelar'),
                    onPressed: () => Navigator.pop(context))
              ],
            ));
  }

  void addViajeToList(String nombre, String horaSalida) {
    print('addViajeToList ${nombre + horaSalida}');
    if (nombre.length > 1 && horaSalida.length > 4) {
      // Agregar
      // emitir: add-viaje
      // { nombre: nombre, salidas: salidas }
      print('${nombre + horaSalida}');
      final socketService = Provider.of<SocketService>(context, listen: false);

      socketService.emit('add-viaje', {'nombre': nombre, 'salida': horaSalida});
    }
    Navigator.pop(context);
  }
}
