import 'package:echnelapp/src/data/services/trip_service.dart';
import 'package:flutter/material.dart';
import 'package:echnelapp/src/ui/widgets/widgets.dart';

class DriverHomePage extends StatefulWidget {
  const DriverHomePage({Key key}) : super(key: key);

  @override
  State<DriverHomePage> createState() => DriverHomePageState();
}

class DriverHomePageState extends State<DriverHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDriver(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: MenuDrawer(),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20, top: 10),
            child: Text(
              'Driver',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
              child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  height: MediaQuery.of(context).size.height * 0.70,
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, 'driver/trip');
                        },
                        child: Container(
                          width: 100,
                          color: Colors.grey,
                          child: Column(
                            children: [
                              Text(
                                'transportes Samella',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
                                    onDoubleTap: () {},
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'driver/info', (route) => false);
                        },
                        child: Container(
                          width: 100,
                          color: Colors.grey,
                          child: Column(
                            children: [
                              Text(
                                'Ir al Viaje',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Divider(height: 10, color: Colors.transparent),
                              Container(
                                  margin: EdgeInsets.all(50),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          ),
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
