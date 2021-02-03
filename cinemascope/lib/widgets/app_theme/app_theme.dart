import 'package:flutter/material.dart';

import '../../global/app_themes_data.dart';
import 'app_theme_data.dart';

class AppTheme extends StatelessWidget {
  const AppTheme(this.child, {Key key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _AppTheme(
      context: context,
      appThemeLight: AppThemesData.appThemeData,
      appThemeDark: AppThemesData.appThemeDataDark,
      child: child,
    );
  }

  static AppThemeData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_AppTheme>()._currentAppThemeData;
}

class _AppTheme extends InheritedWidget {
  const _AppTheme({
    Key key,
    @required BuildContext context,
    @required Widget child,
    @required AppThemeData appThemeLight,
    @required AppThemeData appThemeDark,
  })  : assert(context != null, 'context must not be null'),
        assert(child != null, 'child must not be null'),
        _context = context,
        _appThemeLight = appThemeLight,
        _appThemeDark = appThemeDark,
        super(key: key, child: child);

  final BuildContext _context;
  final AppThemeData _appThemeLight;
  final AppThemeData _appThemeDark;

  Brightness get _brightness => Theme.of(_context).brightness;

  AppThemeData get _currentAppThemeData =>
      _brightness == Brightness.light ? _appThemeLight : _appThemeDark;

  @override
  bool updateShouldNotify(covariant _AppTheme old) => _brightness != old._brightness;
}
