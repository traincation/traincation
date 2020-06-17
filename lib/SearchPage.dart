import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'ApiClient.dart' as apiClient;
import 'MyLocalizations.dart';

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
  Future<Iterable<apiClient.Station>> _search(String query) async {
    final result = await apiClient.search(query);
    return result.stations;
  }

  IconData _iconFromType(apiClient.Type type) {
    switch (type) {
      case apiClient.Type.TRAIN:
        return Icons.train;
      case apiClient.Type.BUS:
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
      itemBuilder: (context, apiClient.Station station) {
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
      onSuggestionSelected: (apiClient.Station suggestion) {
        Navigator.of(context).pop(suggestion.id);
      },
    );
  }
}
