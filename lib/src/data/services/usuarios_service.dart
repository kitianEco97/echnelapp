import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:echnelapp/src/data/models/usuarios_response.dart';
import 'package:echnelapp/src/data/services/services.dart';
import 'package:echnelapp/src/global/environment.dart';
import 'package:provider/provider.dart';

class UsuariosService {
  BuildContext context;
  Usuario usuario;

  // Future init(BuildContext context, Usuario sesionUsuario) {
  Future init(BuildContext context, Function refresh) {
    this.context = context;
    return refresh();
    // this.usuario = sesionUsuario;
  }

  Future<List<Usuario>> getUsuarios() async {
    try {
      var url = Uri.parse('${Environment.apiUrl}/usuarios');

      final resp = await http.get(url, headers: {
        'Content-Type': 'application/json'
        // 'x-token': await AuthService.getToken()
      });

      final usuariosResponse = usuariosResponseFromJson(resp.body);
      return usuariosResponse.msg;
    } catch (e) {
      return [];
    }
  }

  Future<List<Usuario>> getDrivers() async {
    try {
      var url = Uri.parse('${Environment.apiUrl}/usuarios/findByDriver');

      final resp = await http.get(url, headers: {
        'Content-Type': 'application/json'
        // 'x-token': await AuthService.getToken()
      });

      final data = json.decode(resp.body);
      Usuario usuario = Usuario.fromJsonList(data);

      return usuario.toList;
    } catch (e) {
      return [];
    }
  }
}
