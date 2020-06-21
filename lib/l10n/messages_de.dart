// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'de';

  static m0(url) => "Traincation, finden Sie den besten Weg, Ihre Zugferien in der Schweiz zu verbringen: ${url}";

  static m1(name, build) => "Version ${name} (${build})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "Add 2 more stations." : MessageLookupByLibrary.simpleMessage("Fügen Sie zwei weitere Stationen hinzu."),
    "Add a station" : MessageLookupByLibrary.simpleMessage("Station hinzufügen"),
    "Could not open your browser." : MessageLookupByLibrary.simpleMessage("Ihr Browser konnte nicht geöffnet werden."),
    "Could not open your email app." : MessageLookupByLibrary.simpleMessage("Ihre E-Mail-Anwendung konnte nicht geöffnet werden."),
    "Find a train station" : MessageLookupByLibrary.simpleMessage("Einen Bahnhof finden"),
    "For the computation to work, you need to add at least three stations." : MessageLookupByLibrary.simpleMessage("Damit die Berechnung funktioniert, müssen Sie mindestens drei Stationen hinzufügen."),
    "Journey" : MessageLookupByLibrary.simpleMessage("Anreise"),
    "Just one one to go!" : MessageLookupByLibrary.simpleMessage("Nur noch eine!"),
    "Map" : MessageLookupByLibrary.simpleMessage("Karte"),
    "More" : MessageLookupByLibrary.simpleMessage("Mehr"),
    "Not station found" : MessageLookupByLibrary.simpleMessage("Keine Station gefunden"),
    "Share it with your friends" : MessageLookupByLibrary.simpleMessage("Teilen Sie es mit Ihren Freunden"),
    "Start by adding the station from where you will leave." : MessageLookupByLibrary.simpleMessage("Beginnen Sie mit dem Hinzufügen der Station, von der Sie losfahren möchten."),
    "Travel in Switzerland by train" : MessageLookupByLibrary.simpleMessage("Reisen in der Schweiz mit dem Zug"),
    "You need to add stations" : MessageLookupByLibrary.simpleMessage("Bitte fügen Sie Stationen hinzu"),
    "aboutShareText" : m0,
    "aboutVersion" : m1
  };
}
