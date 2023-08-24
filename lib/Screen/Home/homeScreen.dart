// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unused_local_variable, unused_import, non_constant_identifier_names, prefer_if_null_operators

import 'dart:async';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vision_360/Components/searchBar.dart';
import 'package:vision_360/Screen/Home/HomeContainer/newsContainer.dart';
import 'package:vision_360/api/service.dart';

import 'HomeContainer/homeComponents.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen>
    with TickerProviderStateMixin {
  late Future<List> news;
  final PageController _pageController = PageController();
  List<String> genres_item = [
    'Trending',
    'Health',
    'Economic',
    'Food',
    'Dance',
    'Cars',
    'Government'
  ];
  @override
  void initState() {
    news = fetchNews('in');
    Timer.periodic(Duration(microseconds: 50), (timer) => news);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tabBar = TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: true,
      controller: TabController(length: 7, vsync: this),
      tabs: [
        for (String genre in genres_item) _tabView(genre),
      ],
    );
    return Scaffold(
      backgroundColor: Color.fromRGBO(17, 17, 17, 100),
      body: FutureBuilder<List>(
        future: news,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            final newsList = snapshot.data;

            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Searchbar(),
                    tabBar,
                    upper_Scrool_list(),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: newsList!.length,
                        itemBuilder: (context, index) {
                          return NewsBox(
                            title: newsList[index]['title'],
                            time: newsList[index]['publishedAt'],
                            description: newsList[index]['content'].toString(),
                            url: newsList[index]['url'],
                            imageurl: newsList[index]['urlToImage'] == null
                                ? 'https://tse4.mm.bing.net/th?id=OIP.Gf-MiDHTv_xkelVbwA3F2wHaKl&pid=Api&P=0&h=180'
                                : newsList[index]['urlToImage'],
                          );
                        })
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  AspectRatio upper_Scrool_list() {
    return AspectRatio(
      aspectRatio: 1.6,
      child: PageView.builder(
          dragStartBehavior: DragStartBehavior.down,
          physics: ClampingScrollPhysics(),
          itemCount: 10,
          controller: _pageController,
          itemBuilder: (context, index) {
            return carouselView(index, _pageController);
          }),
    );
  }
}

Tab _tabView(String genre_text) {
  return Tab(
      child: Text(genre_text,
          style: GoogleFonts.lato(
            fontSize: 16,
            color: Colors.white,
          )));
}
