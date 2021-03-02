import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:labjobfeature/house/models/house.dart';
import 'package:path/path.dart' as path;

class HouseDataProvider {
  final _baseUrl = 'http://10.6.250.168:8080/api/v1';
  final http.Client httpClient;

  HouseDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<House> createHouse(House house) async {
    try{
    File imageFile = house.asset;
    print(imageFile);
    final request = await http.MultipartRequest('POST',
        Uri.parse('http://10.6.250.168:8080/api/v1/oauth/post'));

        Map<String, String> headers={
          'Content-Type': 'multipart/form-data'
        };

    request.files.add(http.MultipartFile.fromBytes(
      'asset',
      imageFile.readAsBytesSync(),
      filename: path.basename(imageFile.path),
    ));

    request.headers.addAll(headers);
    request.fields.addAll({
      'title': house.title,
      'description': house.description,
      'bedrooms': house.bedrooms.toString(),
      'bathrooms': house.bathrooms.toString(),
      'cost': house.cost,
      'street': house.street,
      'city': house.city,
      'location': house.location,
      'category': house.category
    });

    var responseStream = await request.send();
    print(responseStream);
    final responseString = await responseStream.stream.bytesToString();
    if (responseStream.statusCode == 201) {
      print("response object");
    } else {
      print(responseString);
    }
    } catch (e) {
      print("error happened");
      print(e);
      throw Exception(e);
    }
  }

  Future<List<House>> getHouses() async {
    final response = await httpClient.get('$_baseUrl/oauth/posts');
    if (response.statusCode == 200) {
      final houses = jsonDecode(response.body) as List;
      return houses.map((house) => House.fromJson(house)).toList();
    } else {
      throw Exception('Failed to load houses');
    }
  }

  Future<void> deleteHouse(String id) async {

    final response = await httpClient.delete(
      'http://10.6.250.168:8080/api/v1/oauth/post/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("asfasdf");
    if (response.statusCode != 204) {
      throw Exception('Failed to delete house.');
    }
  }

  Future<void> updateHouse(House house) async {
    try{
      File imageFile = house.asset;
      final request = await http.MultipartRequest('PUT',
          Uri.parse('http://10.6.250.168:8080/api/v1/oauth/post/${house.id}'));

      Map<String, String> headers={
        'Content-Type': 'multipart/form-data'
      };

      request.files.add(http.MultipartFile.fromBytes(
        'asset',
        imageFile.readAsBytesSync(),
        filename: path.basename(imageFile.path),
      ));

      request.headers.addAll(headers);
      request.fields.addAll({
        'title': house.title,
        'description': house.description,
        'bedrooms': house.bedrooms.toString(),
        'bathrooms': house.bathrooms.toString(),
        'cost': house.cost,
        'street': house.street,
        'city': house.city,
        'location': house.location,
        'category': house.category
      });

      var responseStream = await request.send();
      final responseString = await responseStream.stream.bytesToString();
      if (responseStream.statusCode == 201) {
        print("response object");
      } else {
        print(responseString);
      }
    } catch (e) {
      print("error happened");
      print(e);
      throw Exception(e);
    }
  }
}
