// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vision_360/Auth/Athentication%20Pages/SignInpage.dart';
import 'package:vision_360/Auth/Auth%20Models/auth_class.dart';
import 'package:vision_360/Screen/Home/homeScreen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);

    if (user == null) {
      return SignIN();
    } else {
      return home_screen();
    }
  }
}
