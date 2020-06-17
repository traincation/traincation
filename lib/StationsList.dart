import 'package:flutter/material.dart';

import 'ApiClient.dart';

class StationsList extends StatelessWidget {
  StationsList(
      {Key key,
      @required SolverResponse solverResult,
      @required this.removeStationCallback})
      : _legs = _buildLegs(solverResult),
        super(key: key);

  final List<ListLeg> _legs;
  final ValueChanged<String> removeStationCallback;

  static List<ListLeg> _buildLegs(SolverResponse solverResult) {
    final List<ListLeg> legsBuilder = [];

    if (solverResult != null) {
      final Map<String, Station> _stationById = {};
      for (final station in solverResult.stations) {
        _stationById[station.id] = station;
      }

      for (final leg in solverResult.legs) {
        var fromStation = _stationById[leg.from];
        var toStation = _stationById[leg.to];
        legsBuilder.add(ListLeg(
            fromId: leg.from,
            fromStation: fromStation.name,
            toStation: toStation.name,
            durationMinutes: leg.durationMinutes));
      }
    }
    return legsBuilder.toList(growable: false);
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: _legs.length,
        itemBuilder: (context, i) {
          return _buildRow(_legs[i]);
        });
  }

  Widget _buildRow(ListLeg leg) {
    return Dismissible(
      key: Key(leg.fromId),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        removeStationCallback(leg.fromId);
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
        title: Text(leg.fromStation),
        subtitle: Text(leg.toStation),
        trailing: Text(leg.textDuration()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }
}

class ListLeg {
  ListLeg({
    @required this.fromId,
    @required this.fromStation,
    @required this.toStation,
    @required this.durationMinutes,
  });

  final String fromId;
  final String fromStation;
  final String toStation;
  final int durationMinutes;

  String textDuration() {
    final duration = Duration(minutes: durationMinutes);
    final formatted = duration.toString().split('.').first;
    final split = formatted.split(':');
    final hours = split[0];
    final minutes = split[1];

    if (hours == "0") {
      return "$minutes min";
    } else {
      return "$hours h $minutes min";
    }
  }
}
