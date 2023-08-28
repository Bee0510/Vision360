// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vision_360/Screen/Profile/profileScreen.dart';

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            curve: Curves.bounceInOut,
            decoration: BoxDecoration(
              color: Color.fromRGBO(10, 4, 60, 100),
            ),
            child: Hero(
              tag: 'profileHero',
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profileScreen()),
                  );
                },
                child: CircleAvatar(
                  radius: 40,
                  child: Image.network(
                      'https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/man5-512.png'),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
