import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/app_config_model.dart';
import '../models/tmdb_config_model.dart';
import '../services/prefs_service.dart';

part 'settings_store.g.dart';

enum SettingsState { initial, loading, saving, ok }

class SettingsStore = _SettingsStoreBase with _$SettingsStore;

abstract class _SettingsStoreBase with Store {
  _SettingsStoreBase() {
    loadSettings();
  }

  final PrefsService _prefs = Modular.get<PrefsService>();

  @observable
  SettingsState state = SettingsState.initial;

  @action
  void loadSettings() {
    AppConfig.resultsViewType = ResultsViewType.values[_prefs.load<int>(
      PrefsKeys.resultsViewType,
      ResultsViewType.list.index,
    )];

    TmdbConfig.posterSize = PosterSize.values[_prefs.load<int>(
      PrefsKeys.posterSize,
      PosterSize.w92.index,
    )];

    TmdbConfig.profileSize = ProfileSize.values[_prefs.load<int>(
      PrefsKeys.profileSize,
      ProfileSize.w45.index,
    )];

    TmdbConfig.language = TmdbConfigurationLanguage.values[_prefs.load<int>(
      PrefsKeys.language,
      TmdbConfigurationLanguage.enUS.index,
    )];

    TmdbConfig.region = TmdbConfigurationRegion.values[_prefs.load<int>(
      PrefsKeys.region,
      TmdbConfigurationRegion.us.index,
    )];

    TmdbConfig.includeAdult = _prefs.load<bool>(
      PrefsKeys.includeAdult,
      false,
    );

    state = SettingsState.ok;
  }

  @action
  Future<void> saveSettings() async {
    state = SettingsState.saving;

    await _prefs.save<int>(PrefsKeys.resultsViewType, AppConfig.resultsViewType.index);
    await _prefs.save<int>(PrefsKeys.posterSize, TmdbConfig.posterSize.index);
    await _prefs.save<int>(PrefsKeys.profileSize, TmdbConfig.profileSize.index);
    await _prefs.save<int>(PrefsKeys.language, TmdbConfig.language.index);
    await _prefs.save<int>(PrefsKeys.region, TmdbConfig.region.index);
    await _prefs.save<bool>(PrefsKeys.includeAdult, TmdbConfig.includeAdult);

    state = SettingsState.ok;
  }
}
