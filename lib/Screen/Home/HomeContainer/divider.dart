// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Divider(
        color: Colors.white,
      ),
    );
  }
}

class BottomSheetImage extends StatelessWidget {
  final String imageurl, title;
  const BottomSheetImage(
      {Key? key, required this.imageurl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              image: DecorationImage(
                  image: NetworkImage(imageurl), fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 10,
          child: Container(
              padding: EdgeInsets.all(10),
              width: 300,
              child: Text(
                title,
                style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
              )),
        )
      ]),
    );
  }
}
