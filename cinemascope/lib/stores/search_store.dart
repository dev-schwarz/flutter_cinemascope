import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../models/tmdb_config_model.dart';
import '../services/tmdb_service.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  final TmdbService _tmdb = Modular.get<TmdbService>();

  String _currentQuery;

  void queryChanged(String query) {
    _currentQuery = query;
    _fetchSearchMulti();
  }

  @observable
  SearchMulti searchMulti;

  @observable
  ObservableFuture<SearchMulti> fetchSearchMultiFuture = _emptySearchMulti;

  bool get _isLoaded =>
      fetchSearchMultiFuture != _emptySearchMulti &&
      fetchSearchMultiFuture.status == FutureStatus.fulfilled;

  bool get _isLoading =>
      fetchSearchMultiFuture != _emptySearchMulti &&
      fetchSearchMultiFuture.status == FutureStatus.pending;

  @computed
  bool get hasResults => (_isLoaded || _isLoading) && (searchMulti != null);

  @action
  Future<SearchMulti> _fetchSearchMulti() async {
    searchMulti = null;
    final future = _fetchSearchMultiInternal();
    fetchSearchMultiFuture = ObservableFuture(future);

    return searchMulti = await future;
  }

  @action
  Future<SearchMulti> fetchSearchMultiNextPage() async {
    final future = _fetchSearchMultiInternal();
    fetchSearchMultiFuture = ObservableFuture(future);

    return searchMulti = searchMulti.mergeResults(await future);
  }

  Future<SearchMulti> _fetchSearchMultiInternal() {
    return _tmdb.api.search
        .multiSearch(
          _currentQuery,
          page: (searchMulti?.page ?? 0) + 1,
          language: TmdbConfig.language.language,
          region: TmdbConfig.region.region,
          includeAdult: TmdbConfig.includeAdult,
        )
        .then((value) => value);
  }

  static final ObservableFuture<SearchMulti> _emptySearchMulti = ObservableFuture.value(null);
}

class SearchSuggestionsStore = _SearchSuggestionsStoreBase with _$SearchSuggestionsStore;

abstract class _SearchSuggestionsStoreBase with Store {
  final TmdbService _tmdb = Modular.get<TmdbService>();

  String _currentQuery;

  SearchMulti suggestions;

  @observable
  ObservableFuture<SearchMulti> fetchSuggestionsFuture = _emptySuggestions;

  @computed
  bool get hasSuggestions =>
      fetchSuggestionsFuture != _emptySuggestions &&
      fetchSuggestionsFuture.status == FutureStatus.fulfilled;

  @action
  Future<SearchMulti> fetchSuggestions(String query) async {
    if (query == _currentQuery) {
      return Future.value(null);
    }

    _currentQuery = query;
    suggestions = null;
    final future = _tmdb.api.search.multiSearch(
      _currentQuery,
      language: TmdbConfig.language.language,
      region: TmdbConfig.region.region,
      includeAdult: TmdbConfig.includeAdult,
    );
    fetchSuggestionsFuture = ObservableFuture(future);

    return suggestions = await future;
  }

  static final ObservableFuture<SearchMulti> _emptySuggestions = ObservableFuture.value(null);
}
