import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import 'initialize_i18n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final localeName = locale.countryCode == null || locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();

    final canonicalizedLocaleName = Intl.canonicalizedLocale(localeName);

    return initializeMessages(canonicalizedLocaleName).then((_) {
      Intl.defaultLocale = canonicalizedLocaleName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  _General get general => _general;
  final _General _general = const _General();

  _Pages get pages => _pages;
  final _Pages _pages = const _Pages();

  _TmdbObjects get tmdb => _tmdbObjects;
  final _TmdbObjects _tmdbObjects = const _TmdbObjects();

  _MediaButtons get mediaButtons => _mediaButtons;
  final _MediaButtons _mediaButtons = const _MediaButtons();

  _SnackBarMessages get snackBarMessages => _snackBarMessages;
  final _SnackBarMessages _snackBarMessages = const _SnackBarMessages();

  String get appTitle => Intl.message(
        'Cinemascope',
        name: 'appTitle',
        desc: 'App main title',
      );
}

class _General {
  const _General();

  String yes(bool firstLetterUCase) => Intl.select(
        firstLetterUCase,
        {
          true: 'Yes',
          false: 'yes',
        },
        name: 'yes',
        args: [firstLetterUCase],
      );

  String no(bool firstLetterUCase) => Intl.select(
        firstLetterUCase,
        {
          true: 'No',
          false: 'no',
        },
        name: 'no',
        args: [firstLetterUCase],
      );

  String yesNo(bool yes) => Intl.select(
        yes,
        {
          true: 'yes',
          false: 'no',
        },
        name: 'yesNo',
        args: [yes],
      );
}

class _Pages {
  const _Pages();

  _DiscoverMoviesPage get discoverMovies => const _DiscoverMoviesPage();

  String get trending => Intl.message('Trending', name: 'trending');

  String get discover => Intl.message('Discover', name: 'discover');

  String get assignments => Intl.message('Assignments', name: 'assignments');

  String get library => Intl.message('Library', name: 'library');

  String get settings => Intl.message('Settings', name: 'settings');

  String get settingsLanguages => Intl.message('Select a language', name: 'settingsLanguages');

  String get settingsRegions => Intl.message('Select a region', name: 'settingsRegions');
}

class _MediaButtons {
  const _MediaButtons();

  String get favorite => Intl.message(
        'Favorite',
        name: 'favorite',
      );

  String favoriteTooltip(bool value) {
    return Intl.select(
      value,
      {
        true: 'Remove from favorites',
        false: 'Add to favorites',
      },
      name: 'favoriteTooltip',
      args: [value],
    );
  }

  String get watchList => Intl.message(
        'Watch List',
        name: 'watchList',
      );

  String watchListTooltip(bool value) {
    return Intl.select(
      value,
      {
        true: 'Remove from watch list',
        false: 'Add to watch list',
      },
      name: 'watchListTooltip',
      args: [value],
    );
  }

  String get rate => Intl.message(
        'Rate',
        name: 'rate',
      );

  String rateTooltip(bool value) {
    return Intl.select(
      value,
      {
        true: 'Edit or remove your rating',
        false: 'Rate',
      },
      name: 'rateTooltip',
      args: [value],
    );
  }

  String get playlist => Intl.message(
        'Add to playlist',
        name: 'playlist',
      );

  String get playlistTooltip => Intl.message(
        'Add to playlist',
        name: 'playlistTooltip',
      );
}

class _SnackBarMessages {
  const _SnackBarMessages();

  String mediaFavoriteChanged(bool value) => Intl.select(
        value,
        {
          true: 'Added to favorites',
          false: 'Removed from favorites',
        },
        name: 'mediaFavoriteChanged',
        args: [value],
      );

  String mediaWatchListChanged(bool value) => Intl.select(
        value,
        {
          true: 'Added to watch list',
          false: 'Removed from watch list',
        },
        name: 'mediaWatchListChanged',
        args: [value],
      );

  String mediaRateChanged(bool value) => Intl.select(
        value,
        {
          true: 'Item rated',
          false: 'Item rating cleared',
        },
        name: 'mediaRateChanged',
        args: [value],
      );

  String _mediaListsChanged(bool added, int howMany) => Intl.select(
        added,
        {
          true: """${Intl.plural(
            howMany,
            zero: '',
            one: 'Added to 1 list. ',
            other: 'Added to $howMany lists. ',
          )}""",
          false: """${Intl.plural(
            howMany,
            zero: '',
            one: 'Removed from 1 list. ',
            other: 'Removed from $howMany lists. ',
          )}""",
        },
        name: '_mediaListsChanged',
        args: [added, howMany],
      );

  String mediaListsChanged(int listsAdded, int listsRemoved) =>
      '${_mediaListsChanged(true, listsAdded)}'
      '${_mediaListsChanged(false, listsRemoved)}';
}

class _TmdbObjects {
  const _TmdbObjects();

  String sortOrder(SortOrder order, [bool invert = false]) => Intl.select(
        order,
        {
          SortOrder.asc: """${Intl.select(
            invert,
            {
              true: 'descending',
              false: 'ascending',
            },
          )}""",
          SortOrder.desc: """${Intl.select(
            invert,
            {
              true: 'ascending',
              false: 'descending',
            },
          )}""",
        },
        name: 'sortOrder',
        args: [order, invert],
      );

  String _sortOrderSwitch(String orderText) => Intl.message(
        'Switch to "$orderText" order',
        name: '_sortOrderSwitch',
        args: [orderText],
      );

  String sortOrderSwitch(SortOrder order) => _sortOrderSwitch(sortOrder(order, true));
}

class _DiscoverMoviesPage {
  const _DiscoverMoviesPage();

  String get pageTitle => Intl.message('Discover Movies', name: 'pageTitle');

  String get setupTitle => Intl.message('Discover Movies Setup', name: 'setupTitle');

  String get setupButton => Intl.message('Setup Filters', name: 'setupButton');

  String get closeButton => Intl.message('Close', name: 'closeButton');

  String get applyButton => Intl.message('Apply', name: 'applyButton');

  String _sortText(String sortText) => Intl.select(
        sortText,
        {
          'popularity': 'Popularity',
          'original_title': 'Original title',
          'release_date': 'Release date',
          'vote_average': 'Vote average',
          'vote_count': 'Vote count',
          'revenue': 'Revenue',
        },
        name: '_sortText',
        args: [sortText],
      );

  String sortText(DiscoverMovieSortBy sortBy) {
    return _sortText(sortBy.prefixString);
  }

  String orderText(SortOrder order) => Intl.select(
        order,
        {
          SortOrder.asc: 'Ascending order',
          SortOrder.desc: 'Descending order',
        },
        name: 'orderText',
        args: [order],
      );

  String get year => Intl.message('Year', name: 'year');

  String get ofRelease => Intl.message('of release', name: 'ofRelease');

  String get yearOfReleaseHint => Intl.message('Sample: 2004', name: 'yearOfReleaseHint');

  String get yearOfReleaseError => Intl.message('Invalid year', name: 'yearOfReleaseError');
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return (const ['en', 'pt']).contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
