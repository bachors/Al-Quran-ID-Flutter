import 'dart:convert';
import 'package:flutter/foundation.dart';
//import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import '../models/surah.dart';

List<Surah> parseSurah(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var stores = list.map((e) => Surah.fromJson(e)).toList();
  return stores;
}

Future<List<Surah>> fetchSurah() async {

  //final String jsonString = await rootBundle.loadString('data.json');
  //return compute(parseSurah, jsonString);

  final http.Response response = await http.get(
      Uri.parse('https://api.npoint.io/4cdeb24e0cf4e41df79d')
  );
  if (response.statusCode == 200) {
    return compute(parseSurah, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}