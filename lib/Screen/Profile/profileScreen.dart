// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vision_360/Auth/Auth%20Models/auth_class.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(
              child: Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(10, 4, 60, 100),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 55),
                    Hero(
                      tag: 'profileHero',
                      child: CircleAvatar(
                          radius: 50,
                          child: Image.network(
                              'https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/man5-512.png')),
                    ),
                    SizedBox(height: 5),
                    Text('Name',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 2),
                    Text(user.uid,
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            Expanded(
              child: tabbar(),
            ),
          ],
        ),
      ),
    );
  }

  DefaultTabController tabbar() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Saved'),
              Tab(text: 'Updates'),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              children: [
                // Content for Button 1 tab
                Center(child: Text('Saved')),
                // Content for Button 2 tab
                Center(child: Text('More')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
