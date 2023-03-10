import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:echnelapp/src/data/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ViajesService extends ChangeNotifier {
  final String _baseUrl = 'echnelapp-2023-default-rtdb.firebaseio.com';
  List<Viaje> viajes = [];
  Viaje? selectedViaje;

  final storage = new FlutterSecureStorage();

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  ViajesService() {
    this.loadProducts();
  }

  Future<List<Viaje>> loadProducts() async {
    this.isLoading = true;
    notifyListeners();

    final token = await storage.read(key: 'token');

    final url = Uri.https(_baseUrl, 'viajes.json', {'auth': token});
    final resp = await http.get(url);

    final viajesMap = json.decode(resp.body);

    viajesMap.forEach((key, value) {
      final tempViaje = Viaje.fromMap(value);
      tempViaje.id = key;
      this.viajes.add(tempViaje);
    });

    this.viajes = viajes;

    notifyListeners();
    this.isLoading = false;
    return this.viajes;
  }

  Future saveOrCreateViaje(Viaje viaje) async {
    isSaving = true;
    notifyListeners();

    if (viaje.id == null) {
      await this.createViaje(viaje);
    } else {
      await this.updateViaje(viaje);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateViaje(Viaje viaje) async {
    final url = Uri.https(_baseUrl, 'viajes/${viaje.id}.json');
    final resp = await http.put(url, body: viaje.toJson());
    final decodedData = resp.body;

    final index = this.viajes.indexWhere((element) => element.id == viaje.id);
    this.viajes[index] = viaje;
    notifyListeners();
    return viaje.id!;
  }

  Future<String> createViaje(Viaje viaje) async {
    final url = Uri.https(_baseUrl, 'viajes.json');
    final resp = await http.post(url, body: viaje.toJson());
    final decodedData = json.decode(resp.body);

    viaje.id = decodedData['name'];
    this.viajes.add(viaje);

    return viaje.id!;
  }

  void updateSelectedProductImage(String path) {
    this.selectedViaje!.picture = path;
    this.newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (this.newPictureFile == null) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dbgdqdgds/image/upload?upload_preset=cvfsjo9i');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salio mal');
      print(resp.body);
      return null;
    }

    this.newPictureFile = null;

    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }
}
