import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:echnelapp/src/data/models/models.dart';

class AdminTutorialPage extends StatefulWidget {
  const AdminTutorialPage({Key? key}) : super(key: key);

  @override
  State<AdminTutorialPage> createState() => _AdminTutorialPageState();
}

class _AdminTutorialPageState extends State<AdminTutorialPage> {
  List<Trip> trip = [
    Trip(
        id: '1',
        name: 'santiago1008',
        salida: '10:30',
        descripcion: 'viaje con dirección a santiago'),
    Trip(
        id: '2',
        name: 'til-til1120',
        salida: '12:30',
        descripcion: 'viaje con dirección a til-til'),
    Trip(
        id: '3',
        name: 'santiago1340',
        salida: '14:00',
        descripcion: 'viaje con dirección a santiago'),
    Trip(
        id: '4',
        name: 'til-til1421',
        salida: '10:30',
        descripcion: 'viaje con dirección a til til'),
  ];

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
        itemCount: trip.length,
        itemBuilder: (context, i) => _tripTile(trip[i]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: addNewViaje,
      ),
    );
  }

  Widget _tripTile(Trip trip) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      onDismissed: (DismissDirection direction) {
        print('direction: $direction');
        print('id: ${trip.id}');
        // TODO: LLAMAR EL BORRADO DEL SERVER
      },
      key: Key(trip.id!),
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
          child: Text(trip.name!.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(trip.name!),
        trailing: Text(
          '${trip.salida}',
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {
          print(trip.name);
        },
      ),
    );
  }

  addNewViaje() {
    final textNombreController = new TextEditingController();
    final textSalidaController = new TextEditingController();
    final textComentariosController = new TextEditingController();
    final textLatLngController = new TextEditingController();

    if (Platform.isAndroid) {
      //* ANDROID
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Nuevo Viaje'),
            content: Container(
              height: 300,
              child: Column(
                children: [
                  Text('nombre', style: TextStyle()),
                  TextField(controller: textNombreController),
                  SizedBox(height: 5),
                  Text('salida', style: TextStyle()),
                  TextField(
                    controller: textSalidaController,
                  ),
                  SizedBox(height: 5),
                  Text('comentarios', style: TextStyle()),
                  TextField(
                    controller: textComentariosController,
                  ),
                  SizedBox(height: 5),
                  Text('latLng', style: TextStyle()),
                  TextField(
                    controller: textLatLngController,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                  child: Text('Agregar'),
                  onPressed: () => addViajeToList(
                      textNombreController.text,
                      textSalidaController.text,
                      textComentariosController.text,
                      textLatLngController.text))
            ],
          );
        },
      );
    }

    showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text('Nuevo viaje'),
            content: Container(
              height: 300,
              child: Column(
                children: [
                  Text('nombre', style: TextStyle()),
                  CupertinoTextField(
                    controller: textNombreController,
                  ),
                  SizedBox(height: 5),
                  Text('salida', style: TextStyle()),
                  CupertinoTextField(
                    controller: textSalidaController,
                  ),
                  SizedBox(height: 5),
                  Text('comentarios', style: TextStyle()),
                  CupertinoTextField(
                    controller: textComentariosController,
                  ),
                  SizedBox(height: 5),
                  Text('latLng', style: TextStyle()),
                  CupertinoTextField(
                    controller: textLatLngController,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Agregar'),
                onPressed: () => addViajeToList(
                    textNombreController.text,
                    textSalidaController.text,
                    textComentariosController.text,
                    textLatLngController.text),
              ),
              CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: Text('Cancelar'),
                  onPressed: () => Navigator.pop(context))
            ],
          );
        });
  }

  void addViajeToList(
      String nombre, String salida, String comentarios, String latLng) {
    print(nombre);
    print(salida);
    print(comentarios);
    print(latLng);

    if (nombre.length > 1 && salida.length > 4) {
      // Agregar
      this.trip.add(new Trip(
          id: DateTime.now().toString(),
          name: nombre,
          salida: salida,
          descripcion: comentarios));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
