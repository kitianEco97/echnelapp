import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:echnelapp/src/data/services/services.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    // socketService.socket.emit(event)

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('ServerStatus: ${socketService.serverStatus}')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          // TODO: emitir objeto o mapa que tenga el nombre del usuario
          // * emitir: emitir-mensaje
          //! { nombre: 'Flutter', mensaje: 'Hola desde Flutter' }
          //? emision de un evento; de esta forma se debe emitir la ubicacion de el usuario conductor
          // socketService.socket.emit('emitir-mensaje',
          //! UTILIZANDO EL GETTER CREADO EN EL SERVICIO
          socketService.emit('emitir-mensaje',
              {'nombre': 'Flutter', 'mensaje': 'Hola desde Flutter'});
        },
      ),
    );
  }
}
