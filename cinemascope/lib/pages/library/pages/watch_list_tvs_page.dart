import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../global/app_constants.dart';
import '../../../material.dart';
import '../widgets/library_app_bar_title.dart';

class WatchListTvsPage extends StatelessWidget {
  const WatchListTvsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.dataStore.watchListStore;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppConstants.kAppAppBarTitleSpacing,
        centerTitle: true,
        title: Observer(
          builder: (_) {
            return LibraryAppBarTitle(
              title: 'Tvs to watch',
              listSize: store.hasWatchListTvs ? store.watchListTvs.totalResults : 0,
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
                tooltip: context.i18n.tmdb.sortOrderSwitch(store.watchListTvsSortBy.order),
                onPressed: store.toggleWatchListTvsSortBy,
              );
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return !store.hasWatchListTvs
              ? const BigLoadingIndicator(
                  iconData: Icons.refresh,
                  message: 'Loading',
                )
              : ResultsView<AccountWatchListTvs>(
                  content: store.watchListTvs,
                );
        },
      ),
    );
  }
}
