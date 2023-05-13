import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/services/services.dart';

class DrawerUsr extends StatelessWidget {
  const DrawerUsr({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent.shade700,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nombre de usuario',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    maxLines: 1,
                  ),
                  Text(
                    'Telefono',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    maxLines: 1,
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(top: 10),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/no-image-2.png'),
                      image: AssetImage('assets/no-image-2.png'),
                      fadeInDuration: Duration(milliseconds: 50),
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              )),
          ListTile(
              title: Text('Inicio'),
              trailing: Icon(Icons.home_outlined),
              onTap: () async {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'user/home', (route) => false);
              }),
          ListTile(
              title: Text('Información'),
              trailing: Icon(Icons.info_outline),
              onTap: () async {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'user/info', (route) => false);
              }),
          ListTile(
              title: Text('Cerar sesión'),
              trailing: Icon(Icons.exit_to_app_outlined),
              onTap: () async {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'login', (route) => false);
                AuthService.deleteToken();
              }),
        ],
      ),
    );
  }
}
