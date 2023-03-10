import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class FirebaseServices extends ChangeNotifier {
  Future<List> getViajes() async {
    List viajes = [];
    // TODO: cambiar el nombre de usuario a viajes
    CollectionReference collectionReferenceViajes = db.collection('usuarios');

    QuerySnapshot querySnapshot = await collectionReferenceViajes.get();

    querySnapshot.docs.forEach((documento) {
      viajes.add(documento.data());
    });

    return viajes;
  }
}
