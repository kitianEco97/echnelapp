import 'package:flutter/material.dart';
import 'package:echnelapp/src/ui/widgets/widgets.dart';

class UserMapPage extends StatelessWidget {
  const UserMapPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerUsr(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: MenuDrawer(),
      ),
      body: Container(
        child: Center(
          child: Text('USER_MAP_PAGE'),
        ),
      ),
    );
  }
}
