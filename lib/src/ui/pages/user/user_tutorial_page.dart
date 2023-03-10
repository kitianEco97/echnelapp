import 'package:flutter/material.dart';

class UserTutorialPage extends StatefulWidget {
  const UserTutorialPage({Key? key}) : super(key: key);

  @override
  State<UserTutorialPage> createState() => _UserTutorialPageState();
}

class _UserTutorialPageState extends State<UserTutorialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 10),
                      child: Text(
                        'Tutorial',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 40, right: 10),
                        child: Image.asset(
                          'assets/dv-logo-black.png',
                          width: 100,
                          height: 100,
                        )),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.70,
                  child: ListView(
                    children: [
                      Container(
                        width: 100,
                        color: Colors.grey,
                        child: Column(
                          children: [
                            Text(
                              'tutorial de uso de la aplicación',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            // Divider(height: 10, color: Colors.transparent),
                            Container(
                                margin: EdgeInsets.all(50),
                                child: Center(
                                  child: Icon(
                                    Icons.usb_rounded,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        width: 120,
                        color: Colors.grey,
                        child: Column(
                          children: [
                            Text(
                              'pestañas de la app',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            // Divider(height: 10, color: Colors.transparent),
                            Container(
                                margin: EdgeInsets.all(50),
                                child: Center(
                                  child: Icon(
                                    Icons.forward,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  color: Colors.transparent,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
