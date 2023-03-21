import 'package:flutter/material.dart';

class Trip {
  String id;
  String nombre;
  String salida;
  Trip({@required this.id, this.nombre, this.salida});

  factory Trip.fromMap(Map<String, dynamic> obj) => Trip(
        id: obj.containsKey('id') ? obj['id'] : 'no-id',
        nombre: obj.containsKey('nombre') ? obj['nombre'] : 'no-nombre',
        salida: obj.containsKey('salida') ? obj['salida'] : 'no-salida',
        // votes: obj.containsKey('votes') ? obj['votes'] : 'no-votes',
      );
}
