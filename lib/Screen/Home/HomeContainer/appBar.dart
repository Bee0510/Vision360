// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:vision_360/Auth/Auth/Auth.dart';

AppBar appBar() {
  final Authentication auth = Authentication();
  return AppBar(
    backgroundColor: Color.fromRGBO(17, 17, 17, 100),
    title: Text(
      'Vision360',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    centerTitle: true,
    leading: Builder(
      builder: (context) {
        return IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: IconButton(
            onPressed: () async {
              auth.signOutFromGoogle();
            },
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.white,
            )),
      ),
    ],
  );
}
