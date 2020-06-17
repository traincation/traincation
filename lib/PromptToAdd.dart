import 'package:flutter/material.dart';
import 'package:traincation/Constants.dart';

import 'MyLocalizations.dart';

class PromptToAdd extends StatelessWidget {
  PromptToAdd(
      {Key key, @required this.remainingStations, @required this.addStation})
      : super(key: key);

  final int remainingStations;
  final VoidCallback addStation;

  String getButtonText(BuildContext context) {
    switch (remainingStations) {
      case 3:
        return MyLocalizations.of(context).promptMissing3;
      case 2:
        return MyLocalizations.of(context).promptMissing2;
      case 1:
        return MyLocalizations.of(context).promptMissing1;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              MyLocalizations.of(context).promptTitle,
              style: textTheme.headline4,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              MyLocalizations.of(context).promptExplaination,
              style: textTheme.bodyText2,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              getButtonText(context),
              style: textTheme.subtitle2,
            ),
          ),
          OutlineButton.icon(
            icon: Icon(Icons.add_circle_outline),
            label: Text(MyLocalizations.of(context).promptAddButton),
            textColor: mainColor,
            onPressed: addStation,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
