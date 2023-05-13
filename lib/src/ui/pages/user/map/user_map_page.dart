import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:echnelapp/src/ui/pages/user/map/user_map_controller.dart';
import 'package:echnelapp/src/ui/widgets/widgets.dart';
import 'package:echnelapp/src/data/services/services.dart';
import 'package:provider/provider.dart';

class UserMapPage extends StatefulWidget {
  UserMapPage({Key key}) : super(key: key);

  @override
  State<UserMapPage> createState() => UserMapPageState();
}

class UserMapPageState extends State<UserMapPage> {
  UserMapController _con = new UserMapController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _con.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerUsr(),
      body: Stack(
        children: [_googleMaps()],
      ),
    );
  }

  Widget _googleMaps() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _con.initialPosition,
      onMapCreated: _con.onMapCreated,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      zoomControlsEnabled: true,
      markers: Set<Marker>.of(_con.markers.values),
      polylines: _con.polylines,
    );
  }

  void refresh() {
    if (!mounted) return;
    setState(() {});
  }
}
