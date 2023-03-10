import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:echnelapp/src/ui/pages/pages.dart';
import 'package:echnelapp/src/data/services/services.dart';

class CheckAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) return Text('');
            print(snapshot.data);
            if (snapshot.data == '') {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => LoginPage(),
                        transitionDuration: Duration(seconds: 0)));
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        // final socketService = Provider.of<SocketService>(context);
                        // pageBuilder: (_, __, ___) => UserHomeMainPage(),
                        pageBuilder: (_, __, ___) => HomeAdminMainPage(),
                        transitionDuration: Duration(seconds: 0)));
              });
            }

            return Container();
          },
        ),
      ),
    );
  }
}
