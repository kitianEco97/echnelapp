import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: <Widget>[],
      // ),
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
                        'Home',
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
                              'En esta pantalla podras configurar tu viaje',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Divider(height: 10, color: Colors.transparent),
                            Container(
                                margin: EdgeInsets.all(50),
                                child: Center(
                                  child: Icon(
                                    Icons.bus_alert,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                          color: Colors.grey[400],
                          width: MediaQuery.of(context).size.width * 0.32,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SafeArea(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onDoubleTap: () => {print('object')},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.32,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      color: Colors.grey,
                                      child: Column(
                                        children: [
                                          Center(
                                            child: Image.asset(
                                              'assets/dv-logo.png',
                                              width: 70,
                                            ),
                                          )
                                        ],
                                      ),
                                      margin: EdgeInsets.all(2),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.32,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    color: Colors.grey,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Image.asset(
                                            'assets/dv-logo.png',
                                            width: 70,
                                          ),
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.all(2),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.32,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    color: Colors.grey,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Image.asset(
                                            'assets/dv-logo.png',
                                            width: 70,
                                          ),
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.all(2),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.32,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    color: Colors.grey,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Image.asset(
                                            'assets/dv-logo.png',
                                            width: 70,
                                          ),
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.all(2),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Container(
                        width: 100,
                        color: Colors.grey,
                        child: Column(
                          children: [
                            Text(
                              'Lineas de buses disponibles',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Divider(height: 10, color: Colors.transparent),
                            Container(
                                margin: EdgeInsets.all(50),
                                child: Center(
                                  child: Icon(
                                    Icons.event_available,
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
