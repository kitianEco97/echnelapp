import 'package:flutter/material.dart';
import 'package:echnelapp/src/data/models/models.dart';
import 'package:echnelapp/src/data/services/trip_service.dart';
import 'package:echnelapp/src/ui/pages/admin/detail-trip/admin_trip_detail_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AdminGetTripController {
  BuildContext context;
  Function refresh;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  Usuario usuario;
  List<Trip> trips = [];

  List<String> status = ['Estacionado', 'EnCamino', 'Finalizado'];
  TripService _tripService = new TripService();

  bool isUpdated;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    _tripService.init(context, refresh);
    getTrips();
  }

  Future<List<Trip>> getTripsByStatus(String status) async {
    return await _tripService.getByStatus(status);
  }

  Future<List<Trip>> getTrips() async {
    return await _tripService.getAll();
  }

  void openBottomSheet(Trip trip) {
    showMaterialModalBottomSheet(
        context: context,
        builder: (context) => AdminTripDetailPage(
              trip: trip,
            ));
  }

  void openDrawer() {
    key.currentState?.openDrawer();
  }

  void deleteTrip(uid) async {
    await _tripService.deleteTrip(uid);
    refresh();
  }
}
