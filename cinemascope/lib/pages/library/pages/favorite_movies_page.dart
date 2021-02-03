import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../global/app_constants.dart';
import '../../../material.dart';
import '../widgets/library_app_bar_title.dart';

class FavoriteMoviesPage extends StatelessWidget {
  const FavoriteMoviesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.dataStore.favoritesStore;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppConstants.kAppAppBarTitleSpacing,
        title: Observer(
          builder: (_) {
            return LibraryAppBarTitle(
              title: 'Favorite Movies',
              listSize: store.hasFavoriteMovies ? store.favoriteMovies.totalResults : 0,
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
                tooltip: context.i18n.tmdb.sortOrderSwitch(store.favoriteMoviesSortBy.order),
                onPressed: store.toggleFavoriteMoviesSortBy,
              );
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return !store.hasFavoriteMovies
              ? const BigLoadingIndicator(
                  iconData: Icons.refresh,
                  message: 'Loading',
                )
              : ResultsView<AccountFavoriteMovies>(
                  content: store.favoriteMovies,
                );
        },
      ),
    );
  }
}
