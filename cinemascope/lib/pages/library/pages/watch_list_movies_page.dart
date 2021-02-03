import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../global/app_constants.dart';
import '../../../material.dart';
import '../widgets/library_app_bar_title.dart';

class WatchListMoviesPage extends StatelessWidget {
  const WatchListMoviesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.dataStore.watchListStore;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppConstants.kAppAppBarTitleSpacing,
        title: Observer(
          builder: (_) {
            return LibraryAppBarTitle(
              title: 'Movies to watch',
              listSize: store.hasWatchListMovies ? store.watchListMovies.totalResults : 0,
            );
          },
        ),
        actions: [
          Observer(
            builder: (_) {
              return IconButton(
                icon: const Icon(
                  Icons.swap_vert,
                  size: 20.0,
                  color: Colors.yellowAccent,
                ),
                visualDensity: VisualDensity.compact,
                tooltip: context.i18n.tmdb.sortOrderSwitch(store.watchListMoviesSortBy.order),
                onPressed: store.toggleWatchListMoviesSortBy,
              );
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return !store.hasWatchListMovies
              ? const BigLoadingIndicator(
                  iconData: Icons.refresh,
                  message: 'Loading',
                )
              : ResultsView<AccountWatchListMovies>(
                  content: store.watchListMovies,
                );
        },
      ),
    );
  }
}
