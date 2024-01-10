// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vision_360/Auth/Auth/Auth.dart';
import 'package:lottie/lottie.dart';

class SignIN extends StatefulWidget {
  const SignIN({super.key});

  @override
  State<SignIN> createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  final Authentication _authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(10, 6, 49, 0.612),
        body: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'VISION 360',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 60),
            Lottie.asset('assets/login.json'),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await _authentication.signInwithGoogle();
                },
                child: Container(
                  width: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Sign i with',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                            './assets/google.png',
                            fit: BoxFit.contain,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 180),
            Text(
              'Greater Than A Television',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
