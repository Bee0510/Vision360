// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

Widget carouselView(int index, PageController _pageController) {
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
              decoration: BoxDecoration(
                  color: randomColor, borderRadius: BorderRadius.circular(20)),
            ),
          ),
        );
      });
}
