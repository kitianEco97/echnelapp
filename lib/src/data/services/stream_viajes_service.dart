import 'package:cloud_firestore/cloud_firestore.dart';

class StreamViajesService {
  final String _baseUrl = 'echnelapp-2023-default-rtdb.firebaseio.com';
  final CollectionReference viajesColection =
      FirebaseFirestore.instance.collection('viajes');

  Stream<QuerySnapshot> get viajes {
    return viajesColection.snapshots();
  }
}
