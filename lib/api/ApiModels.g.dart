// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiModels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SolverRequest _$SolverRequestFromJson(Map<String, dynamic> json) {
  return SolverRequest(
    stationsIds:
        (json['stationsIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SolverRequestToJson(SolverRequest instance) =>
    <String, dynamic>{
      'stationsIds': instance.stationsIds,
    };

SolverResponse _$SolverResponseFromJson(Map<String, dynamic> json) {
  return SolverResponse(
    legs: (json['legs'] as List)
        ?.map((e) => e == null ? null : Leg.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    stations: (json['stations'] as List)
        ?.map((e) =>
            e == null ? null : Station.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SolverResponseToJson(SolverResponse instance) =>
    <String, dynamic>{
      'legs': instance.legs,
      'stations': instance.stations,
    };

SearchRequest _$SearchRequestFromJson(Map<String, dynamic> json) {
  return SearchRequest(
    searchTerm: json['searchTerm'] as String,
  );
}

Map<String, dynamic> _$SearchRequestToJson(SearchRequest instance) =>
    <String, dynamic>{
      'searchTerm': instance.searchTerm,
    };

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) {
  return SearchResponse(
    stations: (json['stations'] as List)
        ?.map((e) =>
            e == null ? null : Station.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'stations': instance.stations,
    };
