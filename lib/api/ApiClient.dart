// To parse this JSON data, do
//
//     final solverResponse = solverResponseFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'ApiModels.dart';

Future<SolverResponse> solve(List<String> stations) async {
  const url = 'https://sbbtsp.herokuapp.com/api/solver';

  var j = {"stationsIds": stations};
  var encoded = json.encode(j);
  var response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: encoded);

  if (response.statusCode == 200) {
    return solverResponseFromJson(response.body);
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(url));
  }
}

Future<SearchResponse> search(String query) async {
  const url = 'https://sbbtsp.herokuapp.com/api/search';

  var j = {"searchTerm": query};
  var encoded = json.encode(j);
  var response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: encoded);

  if (response.statusCode == 200) {
    return searchResponseFromJson(response.body);
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(url));
  }
}
