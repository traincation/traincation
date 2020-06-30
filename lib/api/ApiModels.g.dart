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

Leg _$LegFromJson(Map<String, dynamic> json) {
  return Leg(
    from: json['from'] as String,
    to: json['to'] as String,
    durationMinutes: json['durationMinutes'] as int,
    stationsList:
        (json['stationsList'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$LegToJson(Leg instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'durationMinutes': instance.durationMinutes,
      'stationsList': instance.stationsList,
    };

Station _$StationFromJson(Map<String, dynamic> json) {
  return Station(
    id: json['id'] as String,
    name: json['name'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    type: _$enumDecodeNullable(_$StopTypeEnumMap, json['type'],
        unknownValue: StopType.TRAIN),
  );
}

Map<String, dynamic> _$StationToJson(Station instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'type': _$StopTypeEnumMap[instance.type],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$StopTypeEnumMap = {
  StopType.TRAIN: 'TRAIN',
  StopType.BUS: 'BUS',
};
