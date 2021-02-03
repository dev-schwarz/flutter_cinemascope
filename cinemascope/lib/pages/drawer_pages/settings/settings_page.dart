import 'package:flutter_modular/flutter_modular.dart';

import '../../../global/app_utils.dart';
import '../../../material.dart';
import '../../../models/app_config_model.dart';
import '../../../models/tmdb_config_model.dart';
import '../../../services/tmdb_service.dart';

part 'settings_languages_page.dart';
part 'settings_regions_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Widget> _options;
  bool _includeAdult;
  bool _imageHighQuality;
  ResultsViewType _resultsViewType;

  @override
  void initState() {
    super.initState();

    _resultsViewType = AppConfig.resultsViewType;
    _includeAdult = TmdbConfig.includeAdult;
    _imageHighQuality = TmdbConfig.posterSize != PosterSize.w92;
    _options = _optionsItems
        .map((option) => ListTile(
              contentPadding: _tilePadding,
              title: Text(option.title),
              leading: option.iconData != null ? Icon(option.iconData) : _iconBox,
              onTap: () {
                Modular.to.push(MaterialPageRoute(
                  builder: (_) => option.child,
                ));
              },
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final children = ListUtils.intersperse<Widget>(
      const Divider(height: 1.0),
      _makeItems(),
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.i18n.pages.settings),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: children.length,
        itemBuilder: (_, index) => children[index],
      ),
    );
  }

  List<Widget> _makeItems() {
    return <Widget>[
      ..._options,
      LabeledSwitch(
        label: 'Include adult',
        value: _includeAdult,
        onChanged: (value) {
          setState(() {
            _includeAdult = value;
          });
          TmdbConfig.includeAdult = value;
          // context.settingsStore.saveSettings();
          _saveSettings();
        },
      ),
      LabeledSwitch(
        label: 'Image high quality',
        value: _imageHighQuality,
        onChanged: (value) {
          setState(() {
            _imageHighQuality = value;
          });
          TmdbConfig.posterSize = value ? PosterSize.w185 : PosterSize.w92;
          TmdbConfig.profileSize = value ? ProfileSize.w185 : ProfileSize.w45;
          // context.settingsStore.saveSettings();
          _saveSettings();
        },
      ),
      _resultsViewTypeWidget(),
    ];
  }

  Widget _resultsViewTypeWidget() {
    const List<String> values = ['List', 'Grid'];

    return LabeledDropdown<ResultsViewType>(
      value: _resultsViewType,
      label: 'View mode',
      items: <ResultsViewType>[ResultsViewType.list, ResultsViewType.grid].toList(),
      itemBuilder: (item) => values[item.index],
      onChanged: (value) {
        setState(() {
          _resultsViewType = value;
        });
        AppConfig.resultsViewType = value;
        _saveSettings();
      },
    );
  }

  void _saveSettings() {
    context.settingsStore.saveSettings();
  }

  static const _iconBox = const SizedBox(width: 24.0, height: 24.0);
  static const _tilePadding = const EdgeInsets.all(16.0);

  static const _optionsItems = <_OptionItemData>[
    const _OptionItemData(
      title: 'Language',
      iconData: Icons.language,
      child: const _SettingsLanguagesPage(),
    ),
    const _OptionItemData(
      title: 'Region',
      iconData: Icons.location_on,
      child: const _SettingsRegionsPage(),
    ),
  ];
}

@immutable
class _OptionItemData {
  const _OptionItemData({
    @required this.title,
    @required this.child,
    this.iconData,
  });

  final String title;
  final Widget child;
  final IconData iconData;
}
