import 'package:flutter/material.dart';

import 'Constants.dart';
import 'SearchPage.dart';
import 'StationsList.dart';
import 'StationsMap.dart';
import 'ApiClient.dart' as apiClient;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var stations = List<String>();

  int _selectedTabIndex = 0;
  apiClient.SolverResponse _solverResult;

  void _loadData() async {
    if(stations.length < 3) return;
    var result = await apiClient.solve(stations);
    setState(() {
      _solverResult = result;
    });
  }

  void _addStation(String stationId) async {
    if (!stations.contains(stationId)) {
      stations.add(stationId);
      _loadData();
    }
  }

  void _removeStation(String stationId) async {
    if (stations.contains(stationId)) {
      stations.remove(stationId);
      _loadData();
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  Widget _getPage() {
    switch (_selectedTabIndex) {
      case 0:
        return StationsList(solverResult: _solverResult, removeStationCallback: _removeStation);
      case 1:
        return StationsMap(solverResult: _solverResult);
    }
    return null;
  }

  void _pushSearch(context) async {
    final newStationId = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (context) => SearchPage()),
    );

    if (newStationId != null) {
      _addStation(newStationId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switzerland by train'),
        backgroundColor: mainColor,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () => _pushSearch(context),
          ),
        ],
      ),
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _changeIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text("Journey")),
          BottomNavigationBarItem(
              icon: Icon(Icons.map), title: Text("Map")),
        ],
        selectedItemColor: Colors.green[700],
      ),
    );
  }
}
