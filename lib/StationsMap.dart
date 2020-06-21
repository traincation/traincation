import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ApiClient.dart';

class StationsMap extends StatelessWidget {
  StationsMap({Key key, @required this.solverResult}) : super(key: key);

  final SolverResponse solverResult;

  static final CameraPosition _switzerlandCenter = CameraPosition(
    target: LatLng(46.8711617, 8.4428971),
    zoom: 6.8,
  );

  @override
  Widget build(BuildContext context) {
    final Map<String, Marker> _markers = {};
    final Map<PolylineId, Polyline> _polylines = <PolylineId, Polyline>{};

    if (solverResult != null) {
      final Map<String, Station> _stationById = {};
      for (final station in solverResult.stations) {
        _stationById[station.id] = station;
      }

      for (final leg in solverResult.legs) {
        final from = _stationById[leg.from];
        final to = _stationById[leg.to];

        final markerFrom = Marker(
          markerId: MarkerId(from.name),
          position: LatLng(from.latitude, from.longitude),
          infoWindow: InfoWindow(title: from.name),
        );
        _markers[from.id] = markerFrom;

        final markerTo = Marker(
          markerId: MarkerId(to.name),
          position: LatLng(to.latitude, to.longitude),
          infoWindow: InfoWindow(title: to.name),
        );
        _markers[to.id] = markerTo;

        final PolylineId polylineId = PolylineId("${leg.from}_${leg.to}");

        final List<LatLng> points = <LatLng>[];

        for (final stationId in leg.stationsList) {
          final station = _stationById[stationId];
          points.add(LatLng(station.latitude, station.longitude));
        }

        final Polyline polyline = Polyline(
          polylineId: polylineId,
          consumeTapEvents: false,
          color: Colors.red,
          width: 5,
          points: points,
          geodesic: true,
        );

        _polylines[polylineId] = polyline;
      }
    }

    return GoogleMap(
        initialCameraPosition: _switzerlandCenter,
        markers: _markers.values.toSet(),
        polylines: _polylines.values.toSet(),
        myLocationEnabled: false,
        myLocationButtonEnabled: false);
  }
}
