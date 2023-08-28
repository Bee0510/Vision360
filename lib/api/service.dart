// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, prefer_if_null_operators, unnecessary_null_comparison, unused_import

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vision_360/Components/searchBar.dart';
import 'package:vision_360/api/constant.dart';

Future<List> fetchNews() async {
  final response = await http.get(
    //   Uri.parse(
    //       'https://newsapi.org/v2/top-headlines?country=${coun}&category=technology&pageSize=100&apiKey=' +
    //           Key.key +
    //           '&q=' +
    //           Searchbar.searchcontroller.text),
    // );
    Uri.parse(
        'https://newsapi.org/v2/everything?q=${Searchbar.searchcontroller.text}&apiKey=4d3725a5b52e477d9b69d7607c62276d'),
  );

  Map result = jsonDecode(response.body);
  return (result['articles']);
}

Future<List> fetchCatagoryNews(String coun) async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?q=${Searchbar.searchcontroller.text}&apiKey=4d3725a5b52e477d9b69d7607c62276d'),
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> cat_result = jsonDecode(response.body);
    List<dynamic> articles = cat_result['articles'];
    return articles;
  } else {
    print('API call failed with status code: ${response.statusCode}');
    throw Exception('Failed to fetch category news');
  }
}
