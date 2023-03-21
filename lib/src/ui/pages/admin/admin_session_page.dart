import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:echnelapp/src/data/services/services.dart';
import 'package:echnelapp/src/data/models/models.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AdminSessionPage extends StatefulWidget {
  const AdminSessionPage({Key key}) : super(key: key);

  @override
  State<AdminSessionPage> createState() => _AdminSessionPageState();
}

class _AdminSessionPageState extends State<AdminSessionPage> {
  @override
  Widget build(BuildContext context) {
    // Create storage
    // final storage = new FlutterSecureStorage();
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent.shade700,
        leading: Container(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => {
              // Delete value
              socketService.disconnect(),
              // storage.delete(key: 'rol'),
              Navigator.pushNamedAndRemoveUntil(
                  context, 'login', (route) => false),
              print('object')
            },
            child: Icon(Icons.exit_to_app),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: (socketService.serverStatus == ServerStatus.Online)
                ? Icon(Icons.check_circle, color: Colors.blue)
                : Icon(Icons.offline_bolt, color: Colors.red),
          )
        ],
        title: const Text('Admin'),
      ),
      body: Stack(
        children: [
          Container(
              child: Center(
                  child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        'Perfil',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/dv-logo-black.png',
                          width: 100,
                          height: 100,
                        )),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: ListView(
                    children: [],
                  ),
                  color: Colors.transparent,
                ),
              ],
            ),
          ))),
        ],
      ),
    );
  }
}
