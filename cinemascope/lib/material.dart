import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'global/localizations/app_localizations.dart';
import 'stores/data/data_store.dart';
import 'stores/settings_store.dart';
import 'stores/user_store.dart';
import 'widgets/app_theme/app_theme.dart';
import 'widgets/app_theme/app_theme_data.dart';

export 'package:flutter/material.dart';

export 'widgets/widgets.dart';

extension AppThemeExtension on BuildContext {
  AppThemeData get appTheme => AppTheme.of(this);

  ThemeData get theme => Theme.of(this);
}

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get i18n => AppLocalizations.of(this);
}

extension AppStoresExtension on BuildContext {
  UserStore get userStore => Modular.get<UserStore>();

  DataStore get dataStore => Modular.get<DataStore>();

  SettingsStore get settingsStore => Modular.get<SettingsStore>();
}
