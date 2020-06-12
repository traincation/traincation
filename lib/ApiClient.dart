// To parse this JSON data, do
//
//     final solverResponse = solverResponseFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

SolverResponse solverResponseFromJson(String str) =>
    SolverResponse.fromJson(json.decode(str));

String solverResponseToJson(SolverResponse data) => json.encode(data.toJson());

class SolverResponse {
  SolverResponse({
    this.legs,
    this.stations,
  });

  final List<Leg> legs;
  final List<Station> stations;

  factory SolverResponse.fromJson(Map<String, dynamic> json) => SolverResponse(
        legs: List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
        stations: List<Station>.from(
            json["stations"].map((x) => Station.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
        "stations": List<dynamic>.from(stations.map((x) => x.toJson())),
      };
}

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  SearchResponse({
    this.stations,
  });

  final List<Station> stations;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
    stations: List<Station>.from(json["stations"].map((x) => Station.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "stations": List<dynamic>.from(stations.map((x) => x.toJson())),
  };
}

class Leg {
  Leg({
    this.from,
    this.to,
    this.durationMinutes,
    this.stationsList,
  });

  final String from;
  final String to;
  final int durationMinutes;
  final List<String> stationsList;

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
    from: json["from"],
    to: json["to"],
    durationMinutes: json["durationMinutes"],
    stationsList: List<String>.from(json["stationsList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "from": from,
    "to": to,
    "durationMinutes": durationMinutes,
    "stationsList": List<dynamic>.from(stationsList.map((x) => x)),
  };
}

class Station {
  Station({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.type,
  });

  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final Type type;

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        type: typeValues.map[json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "type": typeValues.reverse[type],
      };
}

enum Type { TRAIN, BUS }

final typeValues = EnumValues({"bus": Type.BUS, "train": Type.TRAIN});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

Future<SolverResponse> solve(List<String> stations) async {
  const url = 'https://sbbtsp.herokuapp.com/api/solver';

  var j = {"stationsIds": stations};
  var encoded = json.encode(j);
  var response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: encoded
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

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
      headers: {"Content-Type": "application/json"},
      body: encoded
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return searchResponseFromJson(response.body);
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
            ' ${response.reasonPhrase}',
        uri: Uri.parse(url));
  }
}
