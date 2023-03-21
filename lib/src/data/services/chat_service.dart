import 'package:echnelapp/src/data/models/mensajes_response.dart';
import 'package:echnelapp/src/data/services/auth_service.dart';
import 'package:echnelapp/src/global/environment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:echnelapp/src/data/models/models.dart';

class ChatService with ChangeNotifier {
  Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioId) async {
    final url = Uri.parse('${Environment.apiUrl}/mensajes/$usuarioId');
    final resp = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'x-token': await AuthService.getToken()
    });

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;
  }
}
