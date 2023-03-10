import 'package:flutter/material.dart';

class LoadingUsrPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Viajes'),
      ),
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.green[700],
        ),
      ),
    );
  }
}
