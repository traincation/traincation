import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'MyLocalizations.dart';
import 'api/ApiClient.dart' as apiClient;
import 'api/ApiModels.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyLocalizations.of(context).searchTitle),
      ),
      body: SearchField(),
    );
  }
}

class SearchField extends StatelessWidget {
  Future<Iterable<Station>> _search(String query) async {
    final result = await apiClient.search(query);
    return result.stations;
  }

  IconData _iconFromType(StopType type) {
    switch (type) {
      case StopType.TRAIN:
        return Icons.train;
      case StopType.BUS:
        return Icons.directions_bus;
    }

    return Icons.pin_drop;
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
          autofocus: true,
          style: DefaultTextStyle.of(context).style.copyWith(fontSize: 30),
          decoration: InputDecoration(border: OutlineInputBorder())),
      suggestionsCallback: (pattern) async {
        return _search(pattern);
      },
      itemBuilder: (context, Station station) {
        return ListTile(
          leading: Icon(_iconFromType(station.type)),
          title: Text(station.name),
        );
      },
      noItemsFoundBuilder: (context) {
        return ListTile(
          title: Text(MyLocalizations.of(context).searchNotFound),
        );
      },
      onSuggestionSelected: (Station suggestion) {
        Navigator.of(context).pop(suggestion.id);
      },
    );
  }
}
