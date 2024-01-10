import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vision_360/Components/searchBar.dart';

Future<List> fetchNews() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/everything?q=${Searchbar.searchcontroller.text}&apiKey=e57ddbc1fbd642cb94578fb7d5d57afd'),
  );

  Map result = jsonDecode(response.body);
  return (result['articles']);
}
