// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, prefer_if_null_operators, unnecessary_null_comparison, unused_import

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vision_360/Components/searchBar.dart';
import 'package:vision_360/api/constant.dart';

Future<List> fetchCatagoryNews(String coun) async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?q=${Searchbar.searchcontroller.text}&apiKey=e57ddbc1fbd642cb94578fb7d5d57afd'),
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> catResult = jsonDecode(response.body);
    List<dynamic> articles = catResult['articles'];
    return articles;
  } else {
    print('API call failed with status code: ${response.statusCode}');
    throw Exception('Failed to fetch category news');
  }
}
