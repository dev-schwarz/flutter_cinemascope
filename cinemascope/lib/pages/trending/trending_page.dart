import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../material.dart';
import '../../stores/results/results_store.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage(this.store, {Key key}) : super(key: key);

  final TrendingStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppDrawerLeadingButton(),
        title: Text(context.i18n.pages.trending),
        actions: const [
          const AppBarSearchButton(),
        ],
      ),
      drawer: const AppDrawer(),
      body: Observer(
        builder: (_) {
          if (!store.hasResults) {
            return BigLoadingIndicator(
              iconData: Icons.trending_up,
              title: 'Loading',
              message: context.i18n.pages.trending,
            );
          } else if (store.hasResults) {
            return ResultsView<Trending>(
              content: store.results,
              handleRefresh: store.fetchResults,
              loadNextPage: store.fetchResultsNextPage,
            );
          }

          return Container();
        },
      ),
    );
  }
}
