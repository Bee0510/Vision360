// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unused_local_variable, unused_import, non_constant_identifier_names, prefer_if_null_operators, unnecessary_brace_in_string_interps, unused_element, camel_case_types

import 'dart:async';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vision_360/Components/modelSheet.dart';
import 'package:vision_360/Components/searchBar.dart';
import 'package:vision_360/Screen/Home/HomeContainer/appBar.dart';
import 'package:vision_360/Screen/Home/HomeContainer/newsContainer.dart';
import 'package:vision_360/api/fetchCatagoryNews.dart';

import '../../api/fetchnews.dart';
import 'HomeContainer/Drawer.dart';
import 'HomeContainer/homeComponents.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen>
    with TickerProviderStateMixin {
  late Future<List> news;
  late Future<List> newsCatagory;
  final PageController _pageController = PageController();
  int currentindex = 0;
  List<String> genres_item = [
    'Trending',
    'Health',
    'Economic',
    'Food',
    'Dance',
    'Cars',
    'Government'
  ];

  void autoScroll() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentindex < 100) {
        currentindex++;
      } else {
        currentindex = 0;
      }
      _pageController.animateToPage(currentindex,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    news = fetchNews();
    autoScroll();
    newsCatagory = fetchCatagoryNews('in');
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
      backgroundColor: Color.fromRGBO(10, 6, 49, 0.612),
      appBar: appBar(),
      drawer: drawer(),
      body: FutureBuilder<List>(
        future: fetchNews(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            final newsList = snapshot.data;
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Searchbar(
                      onSearchPressed: () async {
                        setState(() {
                          news = fetchNews();
                        });
                      },
                    ),
                    // tabBar,
                    FutureBuilder<List>(
                      future: fetchCatagoryNews('in'),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          final newsCatList = snapshot.data;
                          return AspectRatio(
                            aspectRatio: 1.6,
                            child: PageView.builder(
                                onPageChanged: (value) {
                                  currentindex = value;
                                },
                                dragStartBehavior: DragStartBehavior.down,
                                physics: ClampingScrollPhysics(),
                                itemCount: newsCatList!.length,
                                controller: _pageController,
                                itemBuilder: (context, index) {
                                  final list = newsCatList[index];
                                  return carouselView(
                                    index,
                                    _pageController,
                                    list['title'],
                                    list['author'].toString(),
                                    list['publishedAt'],
                                    list['urlToImage'] == null
                                        ? 'https://images.wallpapersden.com/image/download/one-piece-hd-luffy-cool-art_bWhmZWWUmZqaraWkpJRmbmdlrWZlbWU.jpg'
                                        : list['urlToImage'],
                                  );
                                }),
                          );
                        } else if (snapshot.hasError) {
                          return Text('result: ${snapshot.error.toString()}');
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                    // Container(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       IconButton(
                    //           onPressed: () {
                    //             setState(() {
                    //               currentindex--;
                    //             });
                    //             _pageController.animateToPage(currentindex,
                    //                 duration: Duration(seconds: 1),
                    //                 curve: Curves.easeInOut);
                    //           },
                    //           icon: Icon(
                    //             Icons.arrow_circle_left_outlined,
                    //             color: Colors.red,
                    //             size: 40,
                    //           )),
                    //       IconButton(
                    //           onPressed: () {
                    //             setState(() {
                    //               currentindex++;
                    //             });
                    //             _pageController.animateToPage(currentindex,
                    //                 duration: Duration(seconds: 1),
                    //                 curve: Curves.easeInOut);
                    //           },
                    //           icon: Icon(
                    //             Icons.arrow_circle_right_outlined,
                    //             color: Colors.green,
                    //             size: 40,
                    //           ))
                    //     ],
                    //   ),
                    // ),

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
                                ? 'https://images.wallpapersden.com/image/download/one-piece-hd-luffy-cool-art_bWhmZWWUmZqaraWkpJRmbmdlrWZlbWU.jpg'
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
}

Tab _tabView(String genre_text) {
  return Tab(
      child: Text(genre_text,
          style: GoogleFonts.lato(
            fontSize: 16,
            color: Colors.white,
          )));
}
