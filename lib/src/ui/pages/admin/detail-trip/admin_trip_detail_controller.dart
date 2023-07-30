import 'package:echnelapp/src/data/services/trip_service.dart';
import 'package:echnelapp/src/data/services/usuarios_service.dart';
import 'package:echnelapp/src/ui/herlpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:echnelapp/src/data/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AdminTripDetailController {
  BuildContext context;
  Function refresh;

  TextEditingController nombreCtrl = new TextEditingController();
  TextEditingController descripcionCtrl = new TextEditingController();

  Trip trip;
  List<Usuario> usuarios = [];
  UsuariosService usuariosService = new UsuariosService();
  TripService tripService = new TripService();
  String idDriver;

  Future init(BuildContext context, Function refresh, Trip trip) {
    this.context = context;
    this.refresh = refresh;
    this.trip = trip;
    usuariosService.init(context, refresh);
    tripService.init(context, refresh);
    getUsuarios();
    refresh();
  }

  void updateTrip(trip) async {
    ResponseApi responseApi = await tripService.updateTripToEnCamino(trip);
  }

  void updateTripTo(trip) async {
    ResponseApi responseApi = await tripService.updateTripTo(trip);
    mostrarAlerta(context, 'Actualizado', 'Vaje actualizado correctamente');
  }

  void getUsuarios() async {
    usuarios = await usuariosService.getDrivers();
    refresh();
  }

  void deleteTrip(id) async {
    await tripService.deleteTrip(id);
    refresh();
  }
}
