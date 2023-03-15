import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:echnelapp/src/data/services/services.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSessionPage extends StatelessWidget {
  const UserSessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create storage
    // final storage = new FlutterSecureStorage();
    // final socketService = Provider.of<SocketService>(context, listen: false);

    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent.shade700,
        leading: Container(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              // Delete value
              //* socketService.disconnect(),
              Navigator.pushNamedAndRemoveUntil(
                  context, 'login', (route) => false);
              AuthService.deleteToken();
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
        title: const Text('Usuario'),
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
                    children: [
                      Container(
                          width: 100,
                          color: Colors.grey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nombre',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      'Christian Morales',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(height: 20, color: Colors.transparent),
                              Container(
                                  margin: EdgeInsets.all(30),
                                  child: Center(
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          )),
                      Container(
                          width: 100,
                          color: Colors.grey[400],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Correo',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      'kl@kl.com',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(height: 20, color: Colors.transparent),
                              Container(
                                  margin: EdgeInsets.all(30),
                                  child: Center(
                                    child: Icon(
                                      Icons.alternate_email,
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          )),
                      Container(
                          width: 100,
                          color: Colors.grey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rol',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      'User Role',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(height: 20, color: Colors.transparent),
                              Container(
                                  margin: EdgeInsets.all(30),
                                  child: Center(
                                    child: Icon(
                                      Icons.pending_actions_rounded,
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          )),
                    ],
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
