import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';
import 'package:traincation/MyLocalizations.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AboutPageState();
}

class AboutPageState extends State {
  var appName = "Traincation";
  var version = "";
  var buildNumber = "";

  @override
  void initState() {
    super.initState();
    fetchVersions();
  }

  Future<void> fetchVersions() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }

  _launchEmail() async {
    const url = 'mailto:traincation@schmid.pro';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(MyLocalizations.of(context).aboutEmailError),
      ));
    }
  }

  _launchTwitter() async {
    const url = 'https://twitter.com/jonas_schmid';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(MyLocalizations.of(context).aboutBrowserError),
      ));
    }
  }

  _launchSharing() async {
    const url = 'https://traincation.page.link/app';
    Share.share(MyLocalizations.of(context).aboutShareText(url));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        children: [
          Spacer(),
          Text(
            appName,
            style: textTheme.headline4,
          ),
          Text(
            MyLocalizations.of(context).aboutVersion(version, buildNumber),
            style: textTheme.bodyText2,
          ),
          Spacer(),
          FlatButton(
            child: Text("traincation@schmid.pro"),
            onPressed: _launchEmail,
          ),
          FlatButton(
            child: Text("@jonas_schmid"),
            onPressed: _launchTwitter,
          ),
          OutlineButton.icon(
            icon: Icon(Icons.share),
            label: Text(MyLocalizations.of(context).aboutShareButton),
            textColor: Theme.of(context).primaryColor,
            onPressed: _launchSharing,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
