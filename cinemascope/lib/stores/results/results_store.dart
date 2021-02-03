import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../global/app_utils.dart';
import '../../models/discover_movies_filters_model.dart';
import '../../models/tmdb_config_model.dart';
import '../../services/tmdb_service.dart';

part 'discover_movies_store.dart';
part 'results_store.g.dart';
part 'trending_store.dart';

abstract class ResultsStore<T extends TResultsObject> = _ResultsStoreBase<T> with _$ResultsStore;

abstract class _ResultsStoreBase<T extends TResultsObject> with Store {
  _ResultsStoreBase({bool autoFetch = true}) {
    fetchResultsFuture = _emptyResults;
    if (autoFetch) {
      fetchResults();
    }
  }

  final TmdbService _tmdb = Modular.get<TmdbService>();

  final ObservableFuture<T> _emptyResults = ObservableFuture.value(null);

  @observable
  T results;

  @observable
  ObservableFuture<T> fetchResultsFuture;

  bool get _isLoaded =>
      fetchResultsFuture != _emptyResults && fetchResultsFuture.status == FutureStatus.fulfilled;

  bool get _isLoading =>
      fetchResultsFuture != _emptyResults && fetchResultsFuture.status == FutureStatus.pending;

  @computed
  bool get hasResults => (_isLoaded || _isLoading) && (results != null);

  @action
  Future<T> fetchResults() async {
    results = null;
    final future = _fetchResultsInternal();
    fetchResultsFuture = ObservableFuture(future);

    return results = await future;
  }

  @action
  Future<T> fetchResultsNextPage() async {
    final future = _fetchResultsInternal();
    fetchResultsFuture = ObservableFuture(future);

    return results = results.mergeResults(await future);
  }

  Future<T> _fetchResultsInternal();
}
