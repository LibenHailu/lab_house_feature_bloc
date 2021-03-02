import 'dart:convert';

import 'package:labjobfeature/models/constants.dart';
import 'package:meta/meta.dart';
import 'package:labjobfeature/search/models/house.dart';
import 'package:http/http.dart' as http;

class SearchDataProvider {
  final http.Client httpClient;
  SearchDataProvider({@required this.httpClient}) : assert(httpClient != null);
  Future<List<House>> getSearch(String keyword) async {
    final response = await httpClient.get('http://$Host/oauth/posts/$keyword');
    if (response.statusCode == 200) {
      final houses = jsonDecode(response.body) as List;
      return houses.map((house) => House.fromJson(house)).toList();
    } else {
      throw Exception('Failed to load houses');
    }
  }
}
