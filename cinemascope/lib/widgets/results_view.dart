import 'package:tmdb_repository/tmdb_repository.dart';

import '../global/helpers/media_tile_maker_mixin.dart';
import '../material.dart';
import '../models/app_config_model.dart';

abstract class _ResultsViewBase<T extends TResultsObject> extends StatelessWidget
    with MediaTileMakerMixin {
  const _ResultsViewBase(
    Key key,
    this.content,
    this.loadNextPage,
    this.handleRefresh,
  )   : assert(content != null, 'content must not be null'),
        super(key: key);

  final TResultsObject content;
  final Future Function() loadNextPage;
  final Future Function() handleRefresh;
}

class ResultsView<T extends TResultsObject> extends _ResultsViewBase<T> {
  const ResultsView({
    Key key,
    @required TResultsObject content,
    Future Function() loadNextPage,
    Future Function() handleRefresh,
  }) : super(key, content, loadNextPage, handleRefresh);

  @override
  Widget build(BuildContext context) {
    // return Observer(
    //   builder: (_) {},
    // );

    if (AppConfig.resultsViewType == ResultsViewType.list) {
      return _ResultsListView<T>(
        key: super.key,
        content: super.content,
        loadNextPage: super.loadNextPage,
        handleRefresh: super.handleRefresh,
      );
    } else {
      return _ResultsGridView<T>(
        key: super.key,
        content: super.content,
        loadNextPage: super.loadNextPage,
        handleRefresh: super.handleRefresh,
      );
    }
  }
}

class _ResultsListView<T extends TResultsObject> extends _ResultsViewBase<T> {
  const _ResultsListView({
    Key key,
    @required TResultsObject content,
    Future Function() loadNextPage,
    Future Function() handleRefresh,
  }) : super(key, content, loadNextPage, handleRefresh);

  @override
  Widget build(BuildContext context) {
    final view = ListView.builder(
      primary: false,
      shrinkWrap: false,
      cacheExtent: 200.0,
      physics: const AlwaysScrollableScrollPhysics(),
      // physics: const BouncingScrollPhysics(parent: const AlwaysScrollableScrollPhysics()),
      padding: EdgeInsets.zero,
      itemExtent: 180.0,
      itemCount: content.results.length + (content.hasNextPage ? 1 : 0),
      itemBuilder: (ctx, index) {
        if (index < content.results.length) {
          return makeMediaListTile(context, content.results[index]);
        } else {
          if (loadNextPage != null) {
            loadNextPage();
          }
          return const LoadingNextPageIndicator();
        }
      },
    );

    return handleRefresh != null
        ? RefreshIndicator(onRefresh: super.handleRefresh, child: view)
        : view;
  }
}

class _ResultsGridView<T extends TResultsObject> extends _ResultsViewBase<T> {
  const _ResultsGridView({
    Key key,
    @required TResultsObject content,
    Future Function() loadNextPage,
    Future Function() handleRefresh,
  }) : super(key, content, loadNextPage, handleRefresh);

  @override
  Widget build(BuildContext context) {
    final view = GridView.builder(
      primary: false,
      shrinkWrap: false,
      cacheExtent: 100.0,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 9.0 / 16.0,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: content.results.length + (content.hasNextPage ? 1 : 0),
      itemBuilder: (ctx, index) {
        if (index < content.results.length) {
          return makeMediaGridTile(context, content.results[index]);
        } else {
          if (loadNextPage != null) {
            loadNextPage();
          }
          return const LoadingNextPageIndicator();
        }
      },
    );

    return handleRefresh != null
        ? RefreshIndicator(onRefresh: super.handleRefresh, child: view)
        : view;
  }
}
