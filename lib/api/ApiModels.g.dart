// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiModels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
