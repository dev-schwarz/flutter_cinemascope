part of 'results_store.dart';

class TrendingStore = _TrendingStoreBase with _$TrendingStore;

abstract class _TrendingStoreBase extends ResultsStore<Trending> with Store {
  @override
  Future<Trending> _fetchResultsInternal() {
    return _tmdb.api.trending
        .getTrending(
          TTrendingMediaType.all,
          TTrendingTimeWindow.week,
          page: (results?.page ?? 0) + 1,
          language: TmdbConfig.language.language,
        )
        .then((value) => value);
  }
}
