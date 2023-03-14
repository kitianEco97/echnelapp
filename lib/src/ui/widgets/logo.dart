import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Image(image: AssetImage('assets/dv-logo.png')),
            SizedBox(height: 10),
            Image(image: AssetImage('assets/dv-logo-black.png')),
          ],
        ),
      ),
    );
  }
}
