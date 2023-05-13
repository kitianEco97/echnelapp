import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:echnelapp/src/ui/pages/admin/get/admin_get_trip_controller.dart';
import 'package:echnelapp/src/ui/widgets/widgets.dart';

class AdminGetTripPage extends StatefulWidget {
  const AdminGetTripPage({Key key}) : super(key: key);

  @override
  _AdminGetTripPageState createState() => _AdminGetTripPageState();
}

class _AdminGetTripPageState extends State<AdminGetTripPage> {
  AdminGetTripController _con = new AdminGetTripController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            leading: MenuDrawer(),
            bottom: TabBar(
                indicatorColor: Colors.blue,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.green,
                isScrollable: true,
                tabs: List<Widget>.generate(_con.status.length, (index) {
                  return Tab(
                    child: Text(_con.status[index]),
                  );
                })),
          ),
        ),
        drawer: DrawerAdmin(),
        body: TabBarView(
          children: _con.status.map((String status) {
            return FutureBuilder(
              future: _con.getTripsByStatus(status),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.data == null
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        itemCount: snapshot.data.length ?? 0,
                        itemBuilder: (_, index) {
                          return _cardTrip(snapshot.data[index]);
                        });
              },
            );
          }).toList(),
          //  return;
          // }),
        ),
      ),
    );
  }

  Widget _cardTrip(dynamic trip) {
    // return GestureDetector(
    //   onTap: () {
    //     _con.openBottomSheet(trip);
    //   },
    //   child: Container(),
    // );
    return GestureDetector(
      onTap: () {
        _con.openBottomSheet(trip);
      },
      child: Container(
        height: 160,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Card(
          elevation: 3.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'Viaje ${trip.uid}',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              )),
              Container(
                margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      child: Text(
                        'Dirección: ${trip.nombre}',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      child: Text(
                        'Salida: ${trip.descripcion}',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      child: Text(
                        'Estado: ${trip.status}',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
