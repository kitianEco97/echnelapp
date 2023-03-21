import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echnelapp/src/data/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViajesList extends StatefulWidget {
  const ViajesList({Key key}) : super(key: key);

  @override
  _ViajesListState createState() => _ViajesListState();
}

class _ViajesListState extends State<ViajesList> {
  @override
  Widget build(BuildContext context) {
    final viajes = Provider.of<QuerySnapshot>(context);
    //print(viajes.docs);
    for (var doc in viajes.docs) {
      print(doc.data());
    }

    return Container();
  }
}
