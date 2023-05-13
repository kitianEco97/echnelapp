import 'package:echnelapp/src/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:echnelapp/src/data/models/models.dart';
import 'package:echnelapp/src/data/services/trip_service.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DriverGetTripController {
  BuildContext context;
  Function refresh;

  Usuario usuario;
  List<Trip> trips = [];

  List<String> status = ['EnCamino'];
  TripService _tripService = new TripService();

  bool isUpdated;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    _tripService.init(context, refresh);
    getTripsByStatus();
  }

  Future<List<Trip>> getTripsByStatus() async {
    return await _tripService.findByDriverAndStatus();
  }

  Future<List<Trip>> getTrips() async {
    return await _tripService.getAll();
  }

  void openBottomSheet(Trip trip) {
    showMaterialModalBottomSheet(
        context: context,
        builder: (context) => DriverTripDetailPage(
              trip: trip,
            ));
  }
}
