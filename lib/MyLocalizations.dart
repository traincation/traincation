import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class MyLocalizations {
  MyLocalizations(this.localeName);

  static Future<MyLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      return MyLocalizations(localeName);
    });
  }

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  final String localeName;

  String get mainTitle {
    return Intl.message(
      'Travel in Switzerland by train',
      locale: localeName,
    );
  }

  String get promptTitle {
    return Intl.message(
      'You need to add stations',
      locale: localeName,
    );
  }

  String get promptExplaination {
    return Intl.message(
      'For the computation to work, you need to add at least three stations.',
      locale: localeName,
    );
  }

  String get promptMissing3 {
    return Intl.message(
      'Start by adding the station from where you will leave.',
      locale: localeName,
    );
  }

  String get promptMissing2 {
    return Intl.message(
      'Add 2 more stations.',
      locale: localeName,
    );
  }

  String get promptMissing1 {
    return Intl.message(
      'Just one one to go!',
      locale: localeName,
    );
  }

  String get promptAddButton {
    return Intl.message(
      'Add a station',
      locale: localeName,
    );
  }

  String get tabJourney {
    return Intl.message(
      'Journey',
      locale: localeName,
    );
  }

  String get tabMap {
    return Intl.message(
      'Map',
      locale: localeName,
    );
  }

  String get searchTitle {
    return Intl.message(
      'Find a train station',
      locale: localeName,
    );
  }
}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'de', 'fr'].contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) => MyLocalizations.load(locale);

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}
