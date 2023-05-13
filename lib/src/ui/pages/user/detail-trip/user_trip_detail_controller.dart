import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:echnelapp/src/data/services/trip_service.dart';
import 'package:echnelapp/src/ui/pages/pages.dart';
import 'package:echnelapp/src/data/services/usuarios_service.dart';
import 'package:echnelapp/src/ui/herlpers/helpers.dart';
import 'package:echnelapp/src/data/models/models.dart';

class UserTripDetailController {
  BuildContext context;
  Function refresh;

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

  void updateTrip(Trip trip, context) async {
    Navigator.pushNamed(context, 'user/map', arguments: trip.toJson() ?? '');
  }

  void getUsuarios() async {
    usuarios = await usuariosService.getDrivers();
    refresh();
  }
}
