part of 'settings_page.dart';

class _SettingsLanguagesPage extends StatefulWidget {
  const _SettingsLanguagesPage({Key key}) : super(key: key);

  @override
  __SettingsLanguagesPageState createState() => __SettingsLanguagesPageState();
}

class __SettingsLanguagesPageState extends State<_SettingsLanguagesPage> {
  TmdbConfigurationLanguage _selected;
  Future<Map<TmdbConfigurationLanguage, String>> _values;

  @override
  void initState() {
    super.initState();
    _selected = TmdbConfig.language;
    _values = _loadValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i18n.pages.settingsLanguages),
      ),
      body: FutureBuilder<Map<TmdbConfigurationLanguage, String>>(
        future: _values,
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return const BigLoadingIndicator(
              iconData: Icons.language,
              title: 'Loading',
            );
          }

          final tiles = snapshot.data.entries.map((entry) => _makeRadioTile(entry)).toList();

          return SingleChildScrollView(
            child: Column(children: tiles),
          );
        },
      ),
    );
  }

  Widget _makeRadioTile(MapEntry<TmdbConfigurationLanguage, String> entry) {
    return RadioListTile<TmdbConfigurationLanguage>(
      title: Text(entry.value),
      value: entry.key,
      groupValue: _selected,
      onChanged: (value) {
        setState(() {
          _selected = value;
        });
        TmdbConfig.language = value;
        _saveValue();
      },
    );
  }

  void _saveValue() {
    context.settingsStore.saveSettings();
  }

  Future<Map<TmdbConfigurationLanguage, String>> _loadValues() async {
    final TmdbService tmdb = Modular.get<TmdbService>();

    final countries = (await tmdb.api.configuration.getCountries()).results;
    final languages = (await tmdb.api.configuration.getLanguages()).results;

    final Map<TmdbConfigurationLanguage, String> result =
        Map<TmdbConfigurationLanguage, String>.fromEntries(
      TmdbConfigurationLanguage.values.map((item) {
        final split = item.language.split('-');
        final language = languages.firstWhere((l) => l.iso_639_1 == split[0]).englishName;
        final country = countries.firstWhere((c) => c.iso_3166_1 == split[1]).englishName;

        return MapEntry(item, '$language ($country)');
      }).toList(),
    );

    return result;
  }
}
