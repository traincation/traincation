// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static m0(url) => "Traincation, trouver le meilleur chemin pour vos vacances en train en Suisse: ${url}";

  static m1(name, build) => "Version ${name} (${build})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "Add 2 more stations." : MessageLookupByLibrary.simpleMessage("Ajoutez encore 2 gares."),
    "Add a station" : MessageLookupByLibrary.simpleMessage("Ajouter une gare"),
    "Could not open your browser." : MessageLookupByLibrary.simpleMessage("Impossible d\'ouvrir le navigateur"),
    "Could not open your email app." : MessageLookupByLibrary.simpleMessage("Impossible d\'ouvrir l\'app email"),
    "Find a train station" : MessageLookupByLibrary.simpleMessage("Trouver une gare"),
    "For the computation to work, you need to add at least three stations." : MessageLookupByLibrary.simpleMessage("Pour que le calcul fonctionne, vous devez ajouter au moins 3 gares."),
    "Journey" : MessageLookupByLibrary.simpleMessage("Trajet"),
    "Just one one to go!" : MessageLookupByLibrary.simpleMessage("Plus qu\'une!"),
    "Map" : MessageLookupByLibrary.simpleMessage("Carte"),
    "More" : MessageLookupByLibrary.simpleMessage("Plus"),
    "Not station found" : MessageLookupByLibrary.simpleMessage("Aucune gare trouvée"),
    "Share it with your friends" : MessageLookupByLibrary.simpleMessage("Partager avec vos amis"),
    "Start by adding the station from where you will leave." : MessageLookupByLibrary.simpleMessage("Commencez par ajouter votre gare de départ."),
    "Travel in Switzerland by train" : MessageLookupByLibrary.simpleMessage("Voyage en Suisse en train"),
    "You need to add stations" : MessageLookupByLibrary.simpleMessage("Ajouter des gares"),
    "aboutShareText" : m0,
    "aboutVersion" : m1
  };
}
