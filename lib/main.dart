import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ApiClient.dart' as apiClient;
import 'Constants.dart';
import 'MyLocalizations.dart';
import 'PromptToAdd.dart';
import 'SearchPage.dart';
import 'StationsList.dart';
import 'StationsMap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      localizationsDelegates: [
        const MyLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('fr', ''),
        const Locale('de', ''),
      ],
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

final _stationsKey = "stations";

class _MainPageState extends State<MainPage> {
  var stations = List<String>();
  var isLoading = false;

  int _selectedTabIndex = 0;
  apiClient.SolverResponse _solverResult;

  Future<void> _init() async {
    await _fetchStations();
    await _runSolver();
  }

  Future<void> _runSolver() async {
    if (stations.length < 3) return;
    setState(() {
      isLoading = true;
    });
    var result = await apiClient.solve(stations);
    setState(() {
      isLoading = false;
      _solverResult = result;
    });
  }

  Future<void> _addStation(String stationId) async {
    if (stations.contains(stationId)) {
      return;
    }

    setState(() {
      stations.add(stationId);
    });
    await _runSolver();
    await _saveStations();
  }

  Future<void> _removeStation(String stationId) async {
    if (!stations.contains(stationId)) {
      return;
    }

    setState(() {
      stations.remove(stationId);
    });
    await _runSolver();
    await _saveStations();
  }

  Future<void> _fetchStations() async {
    final prefs = await SharedPreferences.getInstance();
    stations = prefs.getStringList(_stationsKey) ?? List<String>();
  }

  Future<void> _saveStations() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_stationsKey, stations);
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  Widget _getPage() {
    // Waiting for the loading to be done before showing anything
    if (_solverResult == null && stations.length >= 3) {
      return null;
    }

    switch (_selectedTabIndex) {
      case 0:
        final remaining = 3 - stations.length;
        if (remaining <= 0) {
          return StationsList(
            solverResult: _solverResult,
            removeStationCallback: (stationId) async {
              await _removeStation(stationId);
            },
          );
        } else {
          return PromptToAdd(
            remainingStations: remaining,
            addStation: _pushSearch,
          );
        }
        break;
      case 1:
        return StationsMap(solverResult: _solverResult);
    }

    return null;
  }

  void _pushSearch() async {
    final newStationId = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (context) => SearchPage()),
    );

    if (newStationId != null) {
      await _addStation(newStationId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyLocalizations.of(context).mainTitle),
        backgroundColor: mainColor,
        actions: getAppBarActions(),
      ),
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _changeIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text(MyLocalizations.of(context).tabJourney)),
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text(MyLocalizations.of(context).tabMap)),
        ],
        selectedItemColor: Colors.green[700],
      ),
    );
  }

  List<Widget> getAppBarActions() {
    final actions = List<Widget>();

    if (isLoading) {
      actions.add(Container(
          padding: const EdgeInsets.all(8.0),
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 30.0,
          )));
    } else {
      actions.add(IconButton(
        icon: Icon(Icons.add_circle_outline),
        onPressed: () => _pushSearch(),
      ));
    }

    return actions;
  }
}
