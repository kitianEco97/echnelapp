import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AdminSessionPage extends StatelessWidget {
  const AdminSessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create storage
    // final storage = new FlutterSecureStorage();
    // final socketService = Provider.of<SocketService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent.shade700,
        leading: Container(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => {
              // Delete value
              // socketService.disconnect(),
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
            margin: EdgeInsets.only(right: 20),
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/dv-logo.png',
              width: 40,
              height: 40,
            ),
          ),
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
