// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
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
  String get localeName => 'messages';

  static m0(added, howMany) => "${Intl.select(added, {'true': '${Intl.plural(howMany, zero: '', one: 'Added to 1 list. ', other: 'Added to ${howMany} lists. ')}', 'false': '${Intl.plural(howMany, zero: '', one: 'Removed from 1 list. ', other: 'Removed from ${howMany} lists. ')}', })}";

  static m1(orderText) => "Switch to \"${orderText}\" order";

  static m2(sortText) => "${Intl.select(sortText, {'popularity': 'Popularity', 'original_title': 'Original title', 'release_date': 'Release date', 'vote_average': 'Vote average', 'vote_count': 'Vote count', 'revenue': 'Revenue', })}";

  static m3(value) => "${Intl.select(value, {'true': 'Remove from favorites', 'false': 'Add to favorites', })}";

  static m4(value) => "${Intl.select(value, {'true': 'Added to favorites', 'false': 'Removed from favorites', })}";

  static m5(value) => "${Intl.select(value, {'true': 'Item rated', 'false': 'Item rating cleared', })}";

  static m6(value) => "${Intl.select(value, {'true': 'Added to watch list', 'false': 'Removed from watch list', })}";

  static m7(firstLetterUCase) => "${Intl.select(firstLetterUCase, {'true': 'No', 'false': 'no', })}";

  static m8(order) => "${Intl.select(order, {'asc': 'Ascending order', 'desc': 'Descending order', })}";

  static m9(value) => "${Intl.select(value, {'true': 'Edit or remove your rating', 'false': 'Rate', })}";

  static m10(order, invert) => "${Intl.select(order, {'asc': '${Intl.select(invert, {'true': 'descending', 'false': 'ascending', })}', 'desc': '${Intl.select(invert, {'true': 'ascending', 'false': 'descending', })}', })}";

  static m11(value) => "${Intl.select(value, {'true': 'Remove from watch list', 'false': 'Add to watch list', })}";

  static m12(firstLetterUCase) => "${Intl.select(firstLetterUCase, {'true': 'Yes', 'false': 'yes', })}";

  static m13(yes) => "${Intl.select(yes, {'true': 'yes', 'false': 'no', })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "_mediaListsChanged" : m0,
    "_sortOrderSwitch" : m1,
    "_sortText" : m2,
    "appTitle" : MessageLookupByLibrary.simpleMessage("Cinemascope"),
    "applyButton" : MessageLookupByLibrary.simpleMessage("Apply"),
    "assignments" : MessageLookupByLibrary.simpleMessage("Assignments"),
    "closeButton" : MessageLookupByLibrary.simpleMessage("Close"),
    "discover" : MessageLookupByLibrary.simpleMessage("Discover"),
    "favorite" : MessageLookupByLibrary.simpleMessage("Favorite"),
    "favoriteTooltip" : m3,
    "library" : MessageLookupByLibrary.simpleMessage("Library"),
    "mediaFavoriteChanged" : m4,
    "mediaRateChanged" : m5,
    "mediaWatchListChanged" : m6,
    "no" : m7,
    "ofRelease" : MessageLookupByLibrary.simpleMessage("of release"),
    "orderText" : m8,
    "pageTitle" : MessageLookupByLibrary.simpleMessage("Discover Movies"),
    "playlist" : MessageLookupByLibrary.simpleMessage("Add to playlist"),
    "playlistTooltip" : MessageLookupByLibrary.simpleMessage("Add to playlist"),
    "rate" : MessageLookupByLibrary.simpleMessage("Rate"),
    "rateTooltip" : m9,
    "settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "settingsLanguages" : MessageLookupByLibrary.simpleMessage("Select a language"),
    "settingsRegions" : MessageLookupByLibrary.simpleMessage("Select a region"),
    "setupButton" : MessageLookupByLibrary.simpleMessage("Setup Filters"),
    "setupTitle" : MessageLookupByLibrary.simpleMessage("Discover Movies Setup"),
    "sortOrder" : m10,
    "trending" : MessageLookupByLibrary.simpleMessage("Trending"),
    "watchList" : MessageLookupByLibrary.simpleMessage("Watch List"),
    "watchListTooltip" : m11,
    "year" : MessageLookupByLibrary.simpleMessage("Year"),
    "yearOfReleaseError" : MessageLookupByLibrary.simpleMessage("Invalid year"),
    "yearOfReleaseHint" : MessageLookupByLibrary.simpleMessage("Sample: 2004"),
    "yes" : m12,
    "yesNo" : m13
  };
}
