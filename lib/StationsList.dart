import 'package:flutter/material.dart';

import 'ApiClient.dart';

class StationsList extends StatelessWidget {
  StationsList(
      {Key key,
      @required SolverResponse solverResult,
      @required this.removeStationCallback})
      : _stations = _buildStations(solverResult),
        super(key: key);

  final List<Station> _stations;
  final ValueChanged<String> removeStationCallback;

  static List<Station> _buildStations(SolverResponse solverResult) {
    final List<Station> stationsBuilder = [];

    if (solverResult != null) {
      var firstStationId = solverResult.legs.first.from;
      var firstStation = solverResult.stations
          .firstWhere((station) => station.id == firstStationId);
      stationsBuilder.add(firstStation);

      for (final leg in solverResult.legs) {
        var stationId = leg.to;
        var station = solverResult.stations
            .firstWhere((station) => station.id == stationId);
        stationsBuilder.add(station);
      }
    }
    return stationsBuilder.toList(growable: false);
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: _stations.length,
        itemBuilder: (context, i) {
          return _buildRow(_stations[i]);
        });
  }

  Widget _buildRow(Station station) {
    return Dismissible(
      key: Key(station.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        removeStationCallback(station.id);
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(16.0),
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: ListTile(
        title: Text(station.name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }
}
