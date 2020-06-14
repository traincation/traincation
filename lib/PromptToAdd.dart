import 'package:flutter/material.dart';
import 'package:traincation/Constants.dart';

class PromptToAdd extends StatelessWidget {
  PromptToAdd({Key key, @required this.remainingStations, @required this.addStation}) : super(key: key);

  final int remainingStations;
  final VoidCallback addStation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              "You need to add stations",
              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 30),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
                "For the computation to work, you need to add at least three stations."),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              "Only $remainingStations remaining!",
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          OutlineButton(
            child: Text("Add a station"),
            textColor: mainColor,
            onPressed: addStation,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
