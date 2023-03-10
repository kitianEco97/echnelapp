import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = new SnackBar(
        content: Center(
      child: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    ));

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
