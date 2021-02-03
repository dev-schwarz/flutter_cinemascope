import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../material.dart';
import '../../stores/results/results_store.dart';

class DiscoverMoviesContents extends StatelessWidget {
  const DiscoverMoviesContents(this.store, {Key key}) : super(key: key);

  final DiscoverMoviesStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (!store.hasResults) {
          return const BigLoadingIndicator(
            iconData: Icons.new_releases,
            title: 'Discovering Movies',
            message: 'Loading...',
          );
        }

        return ResultsView<DiscoverMovie>(
          content: store.results,
          handleRefresh: store.fetchResults,
          loadNextPage: store.fetchResultsNextPage,
        );
      },
    );
  }
}
