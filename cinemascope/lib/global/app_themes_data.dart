import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../widgets/app_theme/app_theme_data.dart';
import 'app_constants.dart';

class AppThemesData {
  const AppThemesData._();

  // static const String _fontFamily = 'SourceSansPro';
  static const String fontRubik = 'Rubik';
  static const String fontLato = 'Lato';
  static const String fontRaleway = 'Raleway';
  static const String fontSourceSansPro = 'SourceSansPro';
  static const String fontNotoSansJP = 'NotoSansJP';
  static const String _fontDefault = fontRubik;

  static const double _mediaDetailsTextStyleLetterSpacing = 0.5;
  static const double _mediaDetailsTextStyleShadowOffset = 2.0;
  static const double _mediaDetailsTextStyleShadowBlurRadius = 5.0;
  static const Color _mediaDetailsTextStyleShadowColor = const Color(0xff000000);

  static final AppThemeData appThemeData = AppThemeData(
    brightness: Brightness.light,
    navigationBarTheme: const NavigationBarThemeData(
      color: const Color(0xff000000),
      highlightedColor: Colors.red,
      textStyle: TextStyle(
        fontFamily: _fontDefault,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0xff000000),
        fontSize: 13.0,
      ),
    ),
    mediaDetailsTheme: const MediaDetailsThemeData(
      appBarBackButtonColor: const Color(0xffffffff),
      appBarBackButtonBackgroundColor: const Color(0xff000000),
      appBarTextStyle1: const TextStyle(
        fontFamily: _fontDefault,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0xffffffff),
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        letterSpacing: _mediaDetailsTextStyleLetterSpacing,
        shadows: <Shadow>[
          const Shadow(
            offset: Offset(_mediaDetailsTextStyleShadowOffset, _mediaDetailsTextStyleShadowOffset),
            color: _mediaDetailsTextStyleShadowColor,
            blurRadius: _mediaDetailsTextStyleShadowBlurRadius,
          ),
        ],
      ),
      appBarTextStyle2: const TextStyle(
        fontFamily: _fontDefault,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0xffffffff),
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        letterSpacing: _mediaDetailsTextStyleLetterSpacing,
        shadows: <Shadow>[
          const Shadow(
            offset: Offset(1.5, 1.5),
            color: _mediaDetailsTextStyleShadowColor,
            blurRadius: _mediaDetailsTextStyleShadowBlurRadius,
          ),
        ],
      ),
      headerBackgroundColor: const Color(0x66000000),
      headerMediaIconCardColor: const Color(0x99000000),
      headerMediaIconCardBackgroundColor: const Color(0x73ffffff),
      headerBottomTextStyle: const TextStyle(
        fontFamily: _fontDefault,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0xd2ffffff),
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        letterSpacing: _mediaDetailsTextStyleLetterSpacing,
        shadows: <Shadow>[
          const Shadow(
            offset: Offset(_mediaDetailsTextStyleShadowOffset, _mediaDetailsTextStyleShadowOffset),
            color: Colors.black87,
            blurRadius: _mediaDetailsTextStyleShadowBlurRadius,
          ),
        ],
      ),
      linkTextStyle: const TextStyle(
        fontFamily: _fontDefault,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.underline,
        color: const Color(0xff2196f3),
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      actionsBarTheme: ActionsBarThemeData(
        buttonColor: const Color(0xff000000),
        buttonTextStyle: const TextStyle(
          fontFamily: _fontDefault,
          textBaseline: TextBaseline.alphabetic,
          decoration: TextDecoration.none,
          color: const Color(0xff000000),
          fontSize: 13.0,
        ),
      ),
    ),
    mediaTileTheme: const MediaTileThemeData(
      titleTextStyle: const TextStyle(
        fontFamily: fontRubik,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0xcc000000),
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
      descriptionTextStyle: const TextStyle(
        fontFamily: fontSourceSansPro,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0x99000000),
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
      ),
      bottomTextStyle: const TextStyle(
        fontFamily: fontNotoSansJP,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0xff000000),
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      mediaIconColor: const Color(0xffe91e63),
      posterBackgroundColor: const Color(0xffe1e1e1),
    ),
    bigButtonTheme: const BigButtonThemeData(
      textColor: const Color(0x78000000),
      backgroundColor: const Color(0xffffffff),
      iconColor: const Color(0xa0ff1744),
      hintTextStyle: TextStyle(
        fontFamily: _fontDefault,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0x96000000),
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
      ),
      hintBackgroundColor: const Color(0x78ff1744),
    ),
  );

  static final AppThemeData appThemeDataDark = AppThemeData(
    brightness: Brightness.dark,
    navigationBarTheme: NavigationBarThemeData(
      color: const Color(0xffffffff),
      highlightedColor: Colors.redAccent[400],
      textStyle: const TextStyle(
        fontFamily: _fontDefault,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0xffffffff),
        fontSize: 13.0,
      ),
    ),
    mediaDetailsTheme: const MediaDetailsThemeData(
      appBarBackButtonColor: const Color(0xffffffff),
      appBarBackButtonBackgroundColor: const Color(0xff000000),
      appBarTextStyle1: const TextStyle(
        fontFamily: fontRubik,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0xffffffff),
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        letterSpacing: _mediaDetailsTextStyleLetterSpacing,
        shadows: <Shadow>[
          const Shadow(
            offset: Offset(_mediaDetailsTextStyleShadowOffset, _mediaDetailsTextStyleShadowOffset),
            color: _mediaDetailsTextStyleShadowColor,
            blurRadius: _mediaDetailsTextStyleShadowBlurRadius,
          ),
        ],
      ),
      appBarTextStyle2: const TextStyle(
        fontFamily: fontRubik,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0xffffffff),
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        letterSpacing: _mediaDetailsTextStyleLetterSpacing,
        shadows: <Shadow>[
          const Shadow(
            offset: Offset(1.5, 1.5),
            color: _mediaDetailsTextStyleShadowColor,
            blurRadius: _mediaDetailsTextStyleShadowBlurRadius,
          ),
        ],
      ),
      headerBackgroundColor: const Color(0x66000000),
      headerMediaIconCardColor: const Color(0x99000000),
      headerMediaIconCardBackgroundColor: const Color(0x73ffffff),
      headerBottomTextStyle: const TextStyle(
        fontFamily: fontRubik,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0xd2ffffff),
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        letterSpacing: _mediaDetailsTextStyleLetterSpacing,
        shadows: <Shadow>[
          const Shadow(
            offset: Offset(_mediaDetailsTextStyleShadowOffset, _mediaDetailsTextStyleShadowOffset),
            color: Colors.black87,
            blurRadius: _mediaDetailsTextStyleShadowBlurRadius,
          ),
        ],
      ),
      linkTextStyle: const TextStyle(
        fontFamily: _fontDefault,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.underline,
        color: const Color(0xff2196f3),
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      actionsBarTheme: ActionsBarThemeData(
        buttonColor: const Color(0xffffffff),
        buttonTextStyle: const TextStyle(
          fontFamily: fontRubik,
          textBaseline: TextBaseline.alphabetic,
          decoration: TextDecoration.none,
          color: const Color(0xffffffff),
          fontSize: 13.0,
        ),
      ),
    ),
    mediaTileTheme: const MediaTileThemeData(
      titleTextStyle: const TextStyle(
        fontFamily: fontRubik,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0xccffffff),
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
      descriptionTextStyle: const TextStyle(
        fontFamily: fontSourceSansPro,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0x99ffffff),
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
      ),
      bottomTextStyle: const TextStyle(
        fontFamily: fontNotoSansJP,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0xffffffff),
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      mediaIconColor: const Color(0xffe91e63),
      posterBackgroundColor: const Color(0xff494949),
    ),
    bigButtonTheme: const BigButtonThemeData(
      textColor: const Color(0x78ffffff),
      backgroundColor: const Color(0xff000000),
      iconColor: const Color(0xa0d50000),
      hintTextStyle: TextStyle(
        fontFamily: _fontDefault,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.none,
        color: const Color(0x96ffffff),
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
      ),
      hintBackgroundColor: const Color(0x78d50000),
    ),
  );

  static final ThemeData theme = ThemeData(
    brightness: Brightness.light,
    primarySwatch:
        MaterialColorGenerator.generateMaterialColorShaded(const Color.fromRGBO(1, 160, 208, 1)),
    //primaryColor: Colors.blue,
    // canvasColor: Colors.amber,
    scaffoldBackgroundColor: AppConstants.kAppScaffoldBackgroundColorLight,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: const Color(0xffb0bec5),
//    actionTextColor: const Color(0xff3030),
//    elevation: 32.0,
    ),
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: Colors.green,
    //   foregroundColor: Colors.white,
    //   splashColor: Colors.grey,
    // ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      centerTitle: true,
      textTheme: TextTheme(
        headline6: _baseTextStyle.merge(const TextStyle(
          fontFamily: fontRubik,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        )),
      ),
    ),
    textTheme: TextTheme(
      bodyText1:
          _body1.merge(TextStyle(color: const Color(0x00000000).withOpacity(_body1.color.opacity))),
      bodyText2:
          _body2.merge(TextStyle(color: const Color(0x00000000).withOpacity(_body2.color.opacity))),
    ).apply(
      fontFamily: fontNotoSansJP,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: MaterialColorGenerator.generateMaterialColorShaded(const Color(0xff0d253f)),
//  primaryColor: const Color(0xff0d253f),
    // canvasColor: Color(0xffff8f00),
    // canvasColor: Color(0xffff6f00),
    scaffoldBackgroundColor: AppConstants.kAppScaffoldBackgroundColorDark,
    snackBarTheme: const SnackBarThemeData(
//    backgroundColor: const Color(0xff9e9e9e),
      backgroundColor: const Color(0xff455a64),
//    actionTextColor: const Color(0xffeeeeee),
//    elevation: 32.0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.deepPurpleAccent,
      foregroundColor: Colors.white,
      // splashColor: Colors.grey,
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      centerTitle: true,
      textTheme: TextTheme(
        headline6: _baseTextStyle.merge(const TextStyle(
          fontFamily: fontRubik,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        )),
      ),
    ),
    textTheme: TextTheme(
      bodyText1:
          _body1.merge(TextStyle(color: const Color(0xffffffff).withOpacity(_body1.color.opacity))),
      bodyText2:
          _body2.merge(TextStyle(color: const Color(0xffffffff).withOpacity(_body2.color.opacity))),
    ).apply(
      fontFamily: fontNotoSansJP,
    ),
  );

  static const TextStyle _baseTextStyle = const TextStyle(
    inherit: true,
    fontFamily: _fontDefault,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
  );

  static final TextStyle _body1 = _baseTextStyle.merge(const TextStyle(
    inherit: true,
    color: const Color(0xcc000000),
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  ));

  static final TextStyle _body2 = _baseTextStyle.merge(const TextStyle(
    inherit: true,
    color: const Color(0x99000000),
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  ));
}

abstract class MaterialColorGenerator {
  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: _tintColor(color, 0.5),
      100: _tintColor(color, 0.4),
      200: _tintColor(color, 0.3),
      300: _tintColor(color, 0.2),
      400: _tintColor(color, 0.1),
      500: _tintColor(color, 0.0),
      600: _tintColor(color, -0.1),
      700: _tintColor(color, -0.2),
      800: _tintColor(color, -0.3),
      900: _tintColor(color, -0.4),
    });
  }

  static MaterialColor generateMaterialColorShaded(Color color) {
    return MaterialColor(color.value, {
      50: _tintColor(color, 0.9),
      100: _tintColor(color, 0.8),
      200: _tintColor(color, 0.6),
      300: _tintColor(color, 0.4),
      400: _tintColor(color, 0.2),
      500: _tintColor(color, 0.0),
      600: _shadeColor(color, 0.1),
      700: _shadeColor(color, 0.2),
      800: _shadeColor(color, 0.3),
      900: _shadeColor(color, 0.4),
    });
  }

  static int _tintValue(int value, double factor) =>
      math.max(0, math.min((value + ((255 - value) * factor)).round(), 255));

  static Color _tintColor(Color color, double factor) => Color.fromRGBO(
      _tintValue(color.red, factor),
      _tintValue(color.green, factor),
      _tintValue(color.blue, factor),
      1);

  static int _shadeValue(int value, double factor) =>
      math.max(0, math.min(value - (value * factor).round(), 255));

  static Color _shadeColor(Color color, double factor) => Color.fromRGBO(
      _shadeValue(color.red, factor),
      _shadeValue(color.green, factor),
      _shadeValue(color.blue, factor),
      1);
}
