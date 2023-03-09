import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/location.dart';

class LocationApi {
  static const scheme = "https";
  static const host = "fluttercrashcourse.com";
  static const prefix = "/api/v1/";

  static Uri getUri(String endpoint, {Map<String, dynamic>? queryParams}) {
    return Uri(
      scheme: scheme,
      host: host,
      path: '$prefix$endpoint',
      queryParameters: queryParams
    );
  }

  static Future<List<Location>> getAll() async {
    var url = getUri('locations');
    final response = await http.get(url);

    if(response.statusCode != 200) {
      throw response.body;
    }

    var locations = <Location>[];
    for(var i in json.decode(response.body)) {
      locations.add(Location.fromJson(i));
    }

    return locations;
  }

  static Future<Location> getLocation(int id) async {
    var url = getUri('locations/$id');
    final response = await http.get(url);

    if(response.statusCode != 200) {
      throw response.body;
    }

    return Location.fromJson(json.decode(response.body));
  }
}