// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget carouselView(int index, PageController _pageController, String author,
    String description, String date, String img) {
  final randomColor = Color(Random().nextInt(0xFFFFFFFF));
  return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.090).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: img,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Image(image: imageProvider, fit: BoxFit.fill),
                    ),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Positioned(
                        bottom: 60,
                        child: Text(
                          author,
                          maxLines: 3,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          overflow: TextOverflow.fade,
                        )),
                  ),
                  Positioned(
                      bottom: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          description,
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 14),
                        ),
                      )),
                  Positioned(
                      bottom: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          date,
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 14),
                        ),
                      ))
                ],
              ),
            ),
          ),
        );
      });
}
