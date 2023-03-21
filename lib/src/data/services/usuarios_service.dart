import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:echnelapp/src/data/models/usuarios_response.dart';
import 'package:echnelapp/src/data/services/services.dart';
import 'package:echnelapp/src/global/environment.dart';
import 'package:provider/provider.dart';

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get('${Environment.apiUrl}/usuarios', headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      });

      final usuariosResponse = usuariosResponseFromJson(resp.body);

      return usuariosResponse.msg;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
