// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vision_360/Components/searchBar.dart';
import 'package:vision_360/api/constant.dart';

Future<List> fetchNews(String coun) async {
  // List<String> countryCodes = ['us', 'in', 'ru', 'gb', 'fr'];
  // List<Map<String, dynamic>> allArticles = [];
  // for (String countryCode in countryCodes) {
  //   final response = await http.get(
  //     Uri.parse(
  //         'https://newsapi.org/v2/top-headlines?country=${countryCode}&category=technology&pageSize=100&apiKey=' +
  //             Key.key +
  //             '&q=' +
  //             Searchbar.searchcontroller.text),
  //   );

  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=${coun}&category=technology&pageSize=100&apiKey=' +
            Key.key +
            '&q=' +
            Searchbar.searchcontroller.text),
  );
  // Uri.parse('https://newsapi.org/v2/everything?q=apple' +
  //     Searchbar.searchcontroller.text +
  //     '&from=2023-08-23&to=2023-08-23&sortBy=popularity&apiKey=75e5ec47602d4731b4160980e9b2408e'));
  Map result = jsonDecode(response.body);
  print(response.body);

  return (result['articles']);
}
