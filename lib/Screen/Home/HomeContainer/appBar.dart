// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

AppBar appBar() {
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
        child: Icon(
          Icons.abc,
          color: Colors.white,
        ),
      ),
    ],
  );
}
