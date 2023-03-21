import 'package:flutter/material.dart';

class DriverInfoPage extends StatefulWidget {
  const DriverInfoPage({Key key}) : super(key: key);

  @override
  State<DriverInfoPage> createState() => _DriverInfoPageState();
}

class _DriverInfoPageState extends State<DriverInfoPage> {
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
                        'Terminal',
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
                              'Información de las proximas salidas',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            // Divider(height: 10, color: Colors.transparent),
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
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Card(
                                color: Colors.grey[400],
                                child: Column(
                                  children: [
                                    Card(
                                      child: Text('Salida desde Santiago'),
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                          child: Text('16:30'),
                                        ),
                                        Card(
                                          child: Text('912h'),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                color: Colors.grey[400],
                                child: Column(
                                  children: [
                                    Card(
                                      child: Text('Salida desde Til-Til'),
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                          child: Text('16:40'),
                                        ),
                                        Card(
                                          child: Text('9320'),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                color: Colors.grey[400],
                                child: Column(
                                  children: [
                                    Card(
                                      child: Text('Salida desde Santiago'),
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                          child: Text('17:55'),
                                        ),
                                        Card(
                                          child: Text('892z'),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                color: Colors.grey[400],
                                child: Column(
                                  children: [
                                    Card(
                                      child: Text('Salida desde Til-Til'),
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                          child: Text('17:10'),
                                        ),
                                        Card(
                                          child: Text('630z'),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Container(
                        width: 120,
                        color: Colors.grey,
                        child: Column(
                          children: [
                            Text(
                              'En camino',
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
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Card(
                                color: Colors.green,
                                child: Column(
                                  children: [
                                    Card(
                                      child: Text('Hacia Santiago'),
                                    ),
                                    Card(
                                      child: Text('oei0'),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                color: Colors.green,
                                child: Column(
                                  children: [
                                    Card(
                                      child: Text('Hacia Til-Til'),
                                    ),
                                    Card(
                                      child: Text('oei0'),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                color: Colors.green,
                                child: Column(
                                  children: [
                                    Card(
                                      child: Text('Hacia Santiago'),
                                    ),
                                    Card(
                                      child: Text('ffe8'),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                color: Colors.green,
                                child: Column(
                                  children: [
                                    Card(
                                      child: Text('Hacia Til-Til'),
                                    ),
                                    Card(
                                      child: Text('938l'),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                color: Colors.green,
                                child: Column(
                                  children: [
                                    Card(
                                      child: Text('Hacia Til-Til'),
                                    ),
                                    Card(
                                      child: Text('938l'),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Container(
                        width: 100,
                        color: Colors.grey,
                        child: Column(
                          children: [
                            Text(
                              'viajes finalizados recientemente',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            // Divider(height: 10, color: Colors.transparent),
                            Container(
                                margin: EdgeInsets.all(50),
                                child: Center(
                                  child: Icon(
                                    Icons.bus_alert_rounded,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Card(
                                color: Colors.red,
                                child: Column(
                                  children: [
                                    Card(
                                      child: Text('Hacia Santiago'),
                                    ),
                                    Card(
                                      child: Text('oei0'),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                color: Colors.red,
                                child: Column(
                                  children: [
                                    Card(
                                      child: Text('Hacia Til-Til'),
                                    ),
                                    Card(
                                      child: Text('oei0'),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                color: Colors.red,
                                child: Column(
                                  children: [
                                    Card(
                                      child: Text('Hacia Santiago'),
                                    ),
                                    Card(
                                      child: Text('ffe8'),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                color: Colors.red,
                                child: Column(
                                  children: [
                                    Card(
                                      child: Text('Hacia Til-Til'),
                                    ),
                                    Card(
                                      child: Text('938l'),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                color: Colors.red,
                                child: Column(
                                  children: [
                                    Card(
                                      child: Text('Hacia Til-Til'),
                                    ),
                                    Card(
                                      child: Text('938l'),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
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
