import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ApiModels.g.dart';

@JsonSerializable()
class SolverRequest {
  SolverRequest({
    @required this.stationsIds,
  });

  final List<String> stationsIds;

  factory SolverRequest.fromJson(Map<String, dynamic> json) =>
      _$SolverRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SolverRequestToJson(this);
}

@JsonSerializable()
class SolverResponse {
  SolverResponse({
    @required this.legs,
    @required this.stations,
  });

  final List<Leg> legs;
  final List<Station> stations;

  factory SolverResponse.fromJson(Map<String, dynamic> json) =>
      _$SolverResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SolverResponseToJson(this);
}

@JsonSerializable()
class SearchRequest {
  SearchRequest({
    @required this.searchTerm,
  });

  final String searchTerm;

  factory SearchRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SearchRequestToJson(this);
}

@JsonSerializable()
class SearchResponse {
  SearchResponse({
    this.stations,
  });

  final List<Station> stations;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@JsonSerializable()
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

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);
  Map<String, dynamic> toJson() => _$LegToJson(this);
}

@JsonSerializable()
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
  @JsonKey(unknownEnumValue: StopType.TRAIN)
  final StopType type;

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);
  Map<String, dynamic> toJson() => _$StationToJson(this);
}

enum StopType { TRAIN, BUS }
