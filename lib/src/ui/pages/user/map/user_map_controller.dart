import 'dart:async';

import 'package:echnelapp/src/data/services/services.dart';
import 'package:echnelapp/src/global/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as location;
import 'package:echnelapp/src/data/models/models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class UserMapController {
  BuildContext context;
  Function refresh;
  Position _position;

  String addressName;
  LatLng addressLatLng;

  CameraPosition initialPosition =
      CameraPosition(target: LatLng(-33.3240483, -70.7252671), zoom: 10);

  Completer<GoogleMapController> _mapController = Completer();

  BitmapDescriptor tripMarker;
  BitmapDescriptor tripMarkerUsr;
  BitmapDescriptor tripToMarkerUsr;
  BitmapDescriptor userPosition;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  TripService _tripService = new TripService();

  Trip trip;

  Set<Polyline> polylines = {};
  List<LatLng> points = [];

  TripService tripService = new TripService();

  IO.Socket socket;

  final _storage = new FlutterSecureStorage();

  LatLng to;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    tripMarker = await createMarkerFromAssets('assets/dv-logo.png');
    tripMarkerUsr = await createMarkerFromAssets('assets/terminal.png');
    tripToMarkerUsr = await createMarkerFromAssets('assets/terminal.png');
    // userPosition = await createMarkerFromAssets('assets/terminal.png');
    trip = Trip.fromJson(
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>);

    addMarker('Til-Til', -33.0902654, -70.9233629, 'Paradero Escuela la Merced',
        '', tripMarkerUsr);
    addMarker('Santiago', -33.4509132, -70.6791715,
        'Terminal de Estación central, Santiago ', '', tripToMarkerUsr);

    final uidUsrTrip = await _storage.read(key: 'uidUsrTrip');

    final socketService = Provider.of<SocketService>(context, listen: false);

    socketService.socket.on('position/$uidUsrTrip', (data) {
      addMarker(
          'driverTrip', data['lat'], data['lng'], 'Tu viaje', '', tripMarker);
      // setPolylines(LatLng(data['lat'], data['lng']),
      //     LatLng(_position.latitude, _position.longitude));
    });

    tripService.init(context, refresh);

    checkGps();
  }

  Future<List<Trip>> getTripsByStatus() async {
    return await _tripService.findByDriverAndStatus();
  }

  Future<void> setPolylines(LatLng from, LatLng to) async {
    PointLatLng pointFrom = PointLatLng(from.latitude, from.longitude);
    ;
    PointLatLng pointTo = PointLatLng(to.latitude, to.longitude);
    ;
    PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
        Environment.API_KEY_MAPS, pointFrom, pointTo);
    for (PointLatLng point in result.points) {
      points.add(LatLng(point.latitude, point.longitude));
    }

    Polyline polyline = Polyline(
        polylineId: PolylineId('polyusr'),
        color: Colors.red,
        points: points,
        width: 6);

    polylines.add(polyline);

    refresh();
  }

  Future<void> setPolylines2(LatLng from, LatLng to) async {
    PointLatLng pointFrom = PointLatLng(from.latitude, from.longitude);
    ;
    PointLatLng pointTo = PointLatLng(to.latitude, to.longitude);
    ;
    PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
        Environment.API_KEY_MAPS, pointFrom, pointTo);
    for (PointLatLng point in result.points) {
      points.add(LatLng(point.latitude, point.longitude));
    }

    Polyline polyline2 = Polyline(
        polylineId: PolylineId('polyusr2'),
        color: Colors.red,
        points: points,
        width: 6);

    polylines.add(polyline2);

    refresh();
  }

  addMarker(String markerId, double lat, double lng, String title,
      String content, BitmapDescriptor iconMarker) {
    MarkerId id = MarkerId(markerId);
    Marker marker = Marker(
        markerId: id,
        icon: iconMarker ?? BitmapDescriptor.defaultMarker,
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: title, snippet: content));
    markers[id] = marker;
    refresh();
  }

  Future<BitmapDescriptor> createMarkerFromAssets(String path) async {
    ImageConfiguration configuration = ImageConfiguration();
    BitmapDescriptor descriptor =
        await BitmapDescriptor.fromAssetImage(configuration, path);
    return descriptor;
  }

  Future<Null> setLocationDraggableInfo() async {
    if (initialPosition != null) {
      double lat = initialPosition.target.latitude;
      double lng = initialPosition.target.longitude;

      List<Placemark> address = await placemarkFromCoordinates(lat, lng);

      if (address != null) {
        if (address.length > 0) {
          String direction = address[0].thoroughfare;
          String street = address[0].subThoroughfare;
          String city = address[0].locality;
          String department = address[0].administrativeArea;
          String country = address[0].country;

          addressName = '$direction #$street, $city, $department';
          addressLatLng = new LatLng(lat, lng);
          refresh();
        }
      }
    }
  }

  void dispose() async {
    final socketService = Provider.of<SocketService>(context, listen: false);
    await socketService.socket.disconnect();
  }

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(
        '[{"elementType":"geometry","stylers":[{"color":"#f5f5f5"}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#f5f5f5"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#bdbdbd"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#eeeeee"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#e5e5e5"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#ffffff"}]},{"featureType":"road.arterial","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#dadada"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#e5e5e5"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#eeeeee"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#c9c9c9"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]}]');
    _mapController.complete(controller);
  }

  void updateLocation() async {
    try {
      await _determinePosition();
      _position = await Geolocator.getCurrentPosition();

      // addMarker('userPosition', _position.latitude, _position.longitude,
      //     'tu posición', 'tu posición', userPosition);

      refresh();
    } catch (e) {
      print(e);
    }
  }

  void checkGps() async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationEnabled) {
      updateLocation();
    } else {
      bool locationGPS = await location.Location().requestService();
      if (locationGPS) {
        updateLocation();
      }
    }
  }

  Future animatedCameraToPosition(double lat, double lng) async {
    GoogleMapController controller = await _mapController.future;
    if (controller != null) {
      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(lat, lng), zoom: 13)));
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
