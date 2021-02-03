import 'package:flutter/material.dart';

class AppConstants {
  const AppConstants._();

  static const kAppTmdbProfileAspectRatio = 0.666666667;
  static const kAppTmdbPosterAspectRatio = 0.666666667;
  static const kAppTmdbBackdropAspectRatio = 1.777777778;

  // static const kAppParagraphIndent = '    ';

  static const kAppAppBarTitleSpacing = 8.0;

  // static const kAppScaffoldBackgroundColorLight = const Color(0xFFFAFAFA); // Colors.grey[50]
  static const kAppScaffoldBackgroundColorLight = const Color(0xFFEEEEEE); // Colors.grey[200]
  static const kAppScaffoldBackgroundColorDark = const Color(0xFF303030); // Colors.grey[850]

  static const kAppLoadingIndicatorColor = const Color(0xffbdbdbd);

  static const kAppListViewPadding = const EdgeInsets.all(4.0);

  static const kAppAlternativeMediaIconSize = 40.0;

  /// Height to a person card in a [PeopleCardsGrid] (140.0).
  /// Testar 180.0
  static const kAppPersonCardHeight = 220.0;

  static const kAppPersonCardsGridMaxItems = 20;

  static const kAppDataFetchDelayInMilliseconds = 500;

  static const kAppListViewDivider = Divider(
    color: Color(0xFFBDBDBD), // Colors.grey[400]
    height: 0.0,
  );

  static const kAppPersonDepartmentOrder = <String, int>{
    'Directing': 100,
    'Writing': 90,
    'Production': 80,
  };
}
