import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../material.dart';
import '../../../stores/results/results_store.dart';
import 'setup/discover_setup_widgets.dart';

part 'discover_movies_sort_selector.dart';

class DiscoverMoviesSetup extends StatefulWidget {
  const DiscoverMoviesSetup(this.store, {Key key, this.opacity}) : super(key: key);

  final DiscoverMoviesStore store;
  final double opacity;

  @override
  DiscoverMoviesSetupState createState() => DiscoverMoviesSetupState();
}

class DiscoverMoviesSetupState extends State<DiscoverMoviesSetup> {
  final TextEditingController _yearController = TextEditingController();

  ReactionDisposer _reactionDisposer;

  DiscoverMoviesFilterStore get _filterStore => widget.store.filterStore;

  @override
  void initState() {
    super.initState();

    _reactionDisposer = reaction((_) => _filterStore.year, (value) {
      if (value is String && value.isEmpty) {
        _yearController.clear();
      } else {
        _yearController.value = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor.withOpacity(widget.opacity),
      child: DiscoverSetupContents(
        title: 'Discover Setup',
        onCancel: _onCancel,
        onApply: _onApply,
        children: [
          _DiscoverMoviesSortSelector(_filterStore),
          // [[ year ]]
          DiscoverSetupFieldTitle(
            title: context.i18n.pages.discoverMovies.year,
            subtitle: context.i18n.pages.discoverMovies.ofRelease,
          ),
          _yearTextField(),
        ],
      ),
    );
  }

  Widget _yearTextField() {
    return Observer(
      builder: (_) {
        return TextFormField(
          controller: _yearController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: context.i18n.pages.discoverMovies.yearOfReleaseHint,
            isDense: true,
            errorText: _filterStore.yearValid
                ? null
                : context.i18n.pages.discoverMovies.yearOfReleaseError,
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _filterStore.setYear('');
              },
            ),
          ),
          keyboardType: TextInputType.number,
          onChanged: _filterStore.setYear,
        );
      },
    );
  }

  void _onCancel() {
    _closeSetup();
    widget.store.resetFilterStore();
  }

  void _onApply() {
    _closeSetup();
    widget.store.applySetupFilter();
  }

  void _closeSetup() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _yearController.dispose();
    _reactionDisposer();
    super.dispose();
  }
}
