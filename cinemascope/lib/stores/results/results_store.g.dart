// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResultsStore<T extends TResultsObject<dynamic>>
    on _ResultsStoreBase<T>, Store {
  Computed<bool> _$hasResultsComputed;

  @override
  bool get hasResults =>
      (_$hasResultsComputed ??= Computed<bool>(() => super.hasResults,
              name: '_ResultsStoreBase.hasResults'))
          .value;

  final _$resultsAtom = Atom(name: '_ResultsStoreBase.results');

  @override
  T get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(T value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$fetchResultsFutureAtom =
      Atom(name: '_ResultsStoreBase.fetchResultsFuture');

  @override
  ObservableFuture<T> get fetchResultsFuture {
    _$fetchResultsFutureAtom.reportRead();
    return super.fetchResultsFuture;
  }

  @override
  set fetchResultsFuture(ObservableFuture<T> value) {
    _$fetchResultsFutureAtom.reportWrite(value, super.fetchResultsFuture, () {
      super.fetchResultsFuture = value;
    });
  }

  final _$fetchResultsAsyncAction =
      AsyncAction('_ResultsStoreBase.fetchResults');

  @override
  Future<T> fetchResults() {
    return _$fetchResultsAsyncAction.run(() => super.fetchResults());
  }

  final _$fetchResultsNextPageAsyncAction =
      AsyncAction('_ResultsStoreBase.fetchResultsNextPage');

  @override
  Future<T> fetchResultsNextPage() {
    return _$fetchResultsNextPageAsyncAction
        .run(() => super.fetchResultsNextPage());
  }

  @override
  String toString() {
    return '''
results: ${results},
fetchResultsFuture: ${fetchResultsFuture},
hasResults: ${hasResults}
    ''';
  }
}

mixin _$DiscoverMoviesStore on _DiscoverMoviesStoreBase, Store {
  final _$filtersAtom = Atom(name: '_DiscoverMoviesStoreBase.filters');

  @override
  DiscoverMoviesFilters get filters {
    _$filtersAtom.reportRead();
    return super.filters;
  }

  @override
  set filters(DiscoverMoviesFilters value) {
    _$filtersAtom.reportWrite(value, super.filters, () {
      super.filters = value;
    });
  }

  final _$viewStoreAtom = Atom(name: '_DiscoverMoviesStoreBase.viewStore');

  @override
  DiscoverMoviesViewStore get viewStore {
    _$viewStoreAtom.reportRead();
    return super.viewStore;
  }

  @override
  set viewStore(DiscoverMoviesViewStore value) {
    _$viewStoreAtom.reportWrite(value, super.viewStore, () {
      super.viewStore = value;
    });
  }

  final _$filterStoreAtom = Atom(name: '_DiscoverMoviesStoreBase.filterStore');

  @override
  DiscoverMoviesFilterStore get filterStore {
    _$filterStoreAtom.reportRead();
    return super.filterStore;
  }

  @override
  set filterStore(DiscoverMoviesFilterStore value) {
    _$filterStoreAtom.reportWrite(value, super.filterStore, () {
      super.filterStore = value;
    });
  }

  final _$_DiscoverMoviesStoreBaseActionController =
      ActionController(name: '_DiscoverMoviesStoreBase');

  @override
  void setFilters(DiscoverMoviesFilters filters) {
    final _$actionInfo = _$_DiscoverMoviesStoreBaseActionController.startAction(
        name: '_DiscoverMoviesStoreBase.setFilters');
    try {
      return super.setFilters(filters);
    } finally {
      _$_DiscoverMoviesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterStore(DiscoverMoviesFilterStore filterStore) {
    final _$actionInfo = _$_DiscoverMoviesStoreBaseActionController.startAction(
        name: '_DiscoverMoviesStoreBase.setFilterStore');
    try {
      return super.setFilterStore(filterStore);
    } finally {
      _$_DiscoverMoviesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filters: ${filters},
viewStore: ${viewStore},
filterStore: ${filterStore}
    ''';
  }
}

mixin _$DiscoverMoviesFilterStore on _DiscoverMoviesFilterStoreBase, Store {
  Computed<bool> _$primaryReleaseYearValidComputed;

  @override
  bool get primaryReleaseYearValid => (_$primaryReleaseYearValidComputed ??=
          Computed<bool>(() => super.primaryReleaseYearValid,
              name: '_DiscoverMoviesFilterStoreBase.primaryReleaseYearValid'))
      .value;
  Computed<bool> _$yearValidComputed;

  @override
  bool get yearValid =>
      (_$yearValidComputed ??= Computed<bool>(() => super.yearValid,
              name: '_DiscoverMoviesFilterStoreBase.yearValid'))
          .value;
  Computed<bool> _$releaseDateGteValidComputed;

  @override
  bool get releaseDateGteValid => (_$releaseDateGteValidComputed ??=
          Computed<bool>(() => super.releaseDateGteValid,
              name: '_DiscoverMoviesFilterStoreBase.releaseDateGteValid'))
      .value;
  Computed<bool> _$releaseDateLteValidComputed;

  @override
  bool get releaseDateLteValid => (_$releaseDateLteValidComputed ??=
          Computed<bool>(() => super.releaseDateLteValid,
              name: '_DiscoverMoviesFilterStoreBase.releaseDateLteValid'))
      .value;
  Computed<bool> _$voteCountGteValidComputed;

  @override
  bool get voteCountGteValid => (_$voteCountGteValidComputed ??= Computed<bool>(
          () => super.voteCountGteValid,
          name: '_DiscoverMoviesFilterStoreBase.voteCountGteValid'))
      .value;
  Computed<bool> _$voteCountLteValidComputed;

  @override
  bool get voteCountLteValid => (_$voteCountLteValidComputed ??= Computed<bool>(
          () => super.voteCountLteValid,
          name: '_DiscoverMoviesFilterStoreBase.voteCountLteValid'))
      .value;
  Computed<bool> _$voteAverageGteValidComputed;

  @override
  bool get voteAverageGteValid => (_$voteAverageGteValidComputed ??=
          Computed<bool>(() => super.voteAverageGteValid,
              name: '_DiscoverMoviesFilterStoreBase.voteAverageGteValid'))
      .value;
  Computed<bool> _$voteAverageLteValidComputed;

  @override
  bool get voteAverageLteValid => (_$voteAverageLteValidComputed ??=
          Computed<bool>(() => super.voteAverageLteValid,
              name: '_DiscoverMoviesFilterStoreBase.voteAverageLteValid'))
      .value;
  Computed<bool> _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_DiscoverMoviesFilterStoreBase.formValid'))
          .value;

  final _$sortByAtom = Atom(name: '_DiscoverMoviesFilterStoreBase.sortBy');

  @override
  DiscoverMovieSortBy get sortBy {
    _$sortByAtom.reportRead();
    return super.sortBy;
  }

  @override
  set sortBy(DiscoverMovieSortBy value) {
    _$sortByAtom.reportWrite(value, super.sortBy, () {
      super.sortBy = value;
    });
  }

  final _$primaryReleaseYearAtom =
      Atom(name: '_DiscoverMoviesFilterStoreBase.primaryReleaseYear');

  @override
  String get primaryReleaseYear {
    _$primaryReleaseYearAtom.reportRead();
    return super.primaryReleaseYear;
  }

  @override
  set primaryReleaseYear(String value) {
    _$primaryReleaseYearAtom.reportWrite(value, super.primaryReleaseYear, () {
      super.primaryReleaseYear = value;
    });
  }

  final _$yearAtom = Atom(name: '_DiscoverMoviesFilterStoreBase.year');

  @override
  String get year {
    _$yearAtom.reportRead();
    return super.year;
  }

  @override
  set year(String value) {
    _$yearAtom.reportWrite(value, super.year, () {
      super.year = value;
    });
  }

  final _$releaseDateGteAtom =
      Atom(name: '_DiscoverMoviesFilterStoreBase.releaseDateGte');

  @override
  String get releaseDateGte {
    _$releaseDateGteAtom.reportRead();
    return super.releaseDateGte;
  }

  @override
  set releaseDateGte(String value) {
    _$releaseDateGteAtom.reportWrite(value, super.releaseDateGte, () {
      super.releaseDateGte = value;
    });
  }

  final _$releaseDateLteAtom =
      Atom(name: '_DiscoverMoviesFilterStoreBase.releaseDateLte');

  @override
  String get releaseDateLte {
    _$releaseDateLteAtom.reportRead();
    return super.releaseDateLte;
  }

  @override
  set releaseDateLte(String value) {
    _$releaseDateLteAtom.reportWrite(value, super.releaseDateLte, () {
      super.releaseDateLte = value;
    });
  }

  final _$voteCountGteAtom =
      Atom(name: '_DiscoverMoviesFilterStoreBase.voteCountGte');

  @override
  String get voteCountGte {
    _$voteCountGteAtom.reportRead();
    return super.voteCountGte;
  }

  @override
  set voteCountGte(String value) {
    _$voteCountGteAtom.reportWrite(value, super.voteCountGte, () {
      super.voteCountGte = value;
    });
  }

  final _$voteCountLteAtom =
      Atom(name: '_DiscoverMoviesFilterStoreBase.voteCountLte');

  @override
  String get voteCountLte {
    _$voteCountLteAtom.reportRead();
    return super.voteCountLte;
  }

  @override
  set voteCountLte(String value) {
    _$voteCountLteAtom.reportWrite(value, super.voteCountLte, () {
      super.voteCountLte = value;
    });
  }

  final _$voteAverageGteAtom =
      Atom(name: '_DiscoverMoviesFilterStoreBase.voteAverageGte');

  @override
  String get voteAverageGte {
    _$voteAverageGteAtom.reportRead();
    return super.voteAverageGte;
  }

  @override
  set voteAverageGte(String value) {
    _$voteAverageGteAtom.reportWrite(value, super.voteAverageGte, () {
      super.voteAverageGte = value;
    });
  }

  final _$voteAverageLteAtom =
      Atom(name: '_DiscoverMoviesFilterStoreBase.voteAverageLte');

  @override
  String get voteAverageLte {
    _$voteAverageLteAtom.reportRead();
    return super.voteAverageLte;
  }

  @override
  set voteAverageLte(String value) {
    _$voteAverageLteAtom.reportWrite(value, super.voteAverageLte, () {
      super.voteAverageLte = value;
    });
  }

  final _$_DiscoverMoviesFilterStoreBaseActionController =
      ActionController(name: '_DiscoverMoviesFilterStoreBase');

  @override
  void setSortBy(DiscoverMovieSortBy sortBy) {
    final _$actionInfo = _$_DiscoverMoviesFilterStoreBaseActionController
        .startAction(name: '_DiscoverMoviesFilterStoreBase.setSortBy');
    try {
      return super.setSortBy(sortBy);
    } finally {
      _$_DiscoverMoviesFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrimaryReleaseYear(String value) {
    final _$actionInfo =
        _$_DiscoverMoviesFilterStoreBaseActionController.startAction(
            name: '_DiscoverMoviesFilterStoreBase.setPrimaryReleaseYear');
    try {
      return super.setPrimaryReleaseYear(value);
    } finally {
      _$_DiscoverMoviesFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYear(String value) {
    final _$actionInfo = _$_DiscoverMoviesFilterStoreBaseActionController
        .startAction(name: '_DiscoverMoviesFilterStoreBase.setYear');
    try {
      return super.setYear(value);
    } finally {
      _$_DiscoverMoviesFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReleaseDateGte(String value) {
    final _$actionInfo = _$_DiscoverMoviesFilterStoreBaseActionController
        .startAction(name: '_DiscoverMoviesFilterStoreBase.setReleaseDateGte');
    try {
      return super.setReleaseDateGte(value);
    } finally {
      _$_DiscoverMoviesFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReleaseDateLte(String value) {
    final _$actionInfo = _$_DiscoverMoviesFilterStoreBaseActionController
        .startAction(name: '_DiscoverMoviesFilterStoreBase.setReleaseDateLte');
    try {
      return super.setReleaseDateLte(value);
    } finally {
      _$_DiscoverMoviesFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVoteCountGte(String value) {
    final _$actionInfo = _$_DiscoverMoviesFilterStoreBaseActionController
        .startAction(name: '_DiscoverMoviesFilterStoreBase.setVoteCountGte');
    try {
      return super.setVoteCountGte(value);
    } finally {
      _$_DiscoverMoviesFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVoteCountLte(String value) {
    final _$actionInfo = _$_DiscoverMoviesFilterStoreBaseActionController
        .startAction(name: '_DiscoverMoviesFilterStoreBase.setVoteCountLte');
    try {
      return super.setVoteCountLte(value);
    } finally {
      _$_DiscoverMoviesFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVoteAverageGte(String value) {
    final _$actionInfo = _$_DiscoverMoviesFilterStoreBaseActionController
        .startAction(name: '_DiscoverMoviesFilterStoreBase.setVoteAverageGte');
    try {
      return super.setVoteAverageGte(value);
    } finally {
      _$_DiscoverMoviesFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVoteAverageLte(String value) {
    final _$actionInfo = _$_DiscoverMoviesFilterStoreBaseActionController
        .startAction(name: '_DiscoverMoviesFilterStoreBase.setVoteAverageLte');
    try {
      return super.setVoteAverageLte(value);
    } finally {
      _$_DiscoverMoviesFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sortBy: ${sortBy},
primaryReleaseYear: ${primaryReleaseYear},
year: ${year},
releaseDateGte: ${releaseDateGte},
releaseDateLte: ${releaseDateLte},
voteCountGte: ${voteCountGte},
voteCountLte: ${voteCountLte},
voteAverageGte: ${voteAverageGte},
voteAverageLte: ${voteAverageLte},
primaryReleaseYearValid: ${primaryReleaseYearValid},
yearValid: ${yearValid},
releaseDateGteValid: ${releaseDateGteValid},
releaseDateLteValid: ${releaseDateLteValid},
voteCountGteValid: ${voteCountGteValid},
voteCountLteValid: ${voteCountLteValid},
voteAverageGteValid: ${voteAverageGteValid},
voteAverageLteValid: ${voteAverageLteValid},
formValid: ${formValid}
    ''';
  }
}

mixin _$DiscoverMoviesViewStore on _DiscoverMoviesViewStoreBase, Store {
  Computed<bool> _$isAnimatingComputed;

  @override
  bool get isAnimating =>
      (_$isAnimatingComputed ??= Computed<bool>(() => super.isAnimating,
              name: '_DiscoverMoviesViewStoreBase.isAnimating'))
          .value;

  final _$setupModeAtom = Atom(name: '_DiscoverMoviesViewStoreBase.setupMode');

  @override
  bool get setupMode {
    _$setupModeAtom.reportRead();
    return super.setupMode;
  }

  @override
  set setupMode(bool value) {
    _$setupModeAtom.reportWrite(value, super.setupMode, () {
      super.setupMode = value;
    });
  }

  final _$opacityAtom = Atom(name: '_DiscoverMoviesViewStoreBase.opacity');

  @override
  double get opacity {
    _$opacityAtom.reportRead();
    return super.opacity;
  }

  @override
  set opacity(double value) {
    _$opacityAtom.reportWrite(value, super.opacity, () {
      super.opacity = value;
    });
  }

  final _$closeButtonOpacityAtom =
      Atom(name: '_DiscoverMoviesViewStoreBase.closeButtonOpacity');

  @override
  double get closeButtonOpacity {
    _$closeButtonOpacityAtom.reportRead();
    return super.closeButtonOpacity;
  }

  @override
  set closeButtonOpacity(double value) {
    _$closeButtonOpacityAtom.reportWrite(value, super.closeButtonOpacity, () {
      super.closeButtonOpacity = value;
    });
  }

  final _$actionIconOpacityAtom =
      Atom(name: '_DiscoverMoviesViewStoreBase.actionIconOpacity');

  @override
  double get actionIconOpacity {
    _$actionIconOpacityAtom.reportRead();
    return super.actionIconOpacity;
  }

  @override
  set actionIconOpacity(double value) {
    _$actionIconOpacityAtom.reportWrite(value, super.actionIconOpacity, () {
      super.actionIconOpacity = value;
    });
  }

  final _$actionIconDataAtom =
      Atom(name: '_DiscoverMoviesViewStoreBase.actionIconData');

  @override
  IconData get actionIconData {
    _$actionIconDataAtom.reportRead();
    return super.actionIconData;
  }

  @override
  set actionIconData(IconData value) {
    _$actionIconDataAtom.reportWrite(value, super.actionIconData, () {
      super.actionIconData = value;
    });
  }

  final _$setupDialogOpacityAtom =
      Atom(name: '_DiscoverMoviesViewStoreBase.setupDialogOpacity');

  @override
  double get setupDialogOpacity {
    _$setupDialogOpacityAtom.reportRead();
    return super.setupDialogOpacity;
  }

  @override
  set setupDialogOpacity(double value) {
    _$setupDialogOpacityAtom.reportWrite(value, super.setupDialogOpacity, () {
      super.setupDialogOpacity = value;
    });
  }

  final _$_DiscoverMoviesViewStoreBaseActionController =
      ActionController(name: '_DiscoverMoviesViewStoreBase');

  @override
  void setAnimationValue(double value) {
    final _$actionInfo = _$_DiscoverMoviesViewStoreBaseActionController
        .startAction(name: '_DiscoverMoviesViewStoreBase.setAnimationValue');
    try {
      return super.setAnimationValue(value);
    } finally {
      _$_DiscoverMoviesViewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
setupMode: ${setupMode},
opacity: ${opacity},
closeButtonOpacity: ${closeButtonOpacity},
actionIconOpacity: ${actionIconOpacity},
actionIconData: ${actionIconData},
setupDialogOpacity: ${setupDialogOpacity},
isAnimating: ${isAnimating}
    ''';
  }
}

mixin _$TrendingStore on _TrendingStoreBase, Store {
  @override
  String toString() {
    return '''

    ''';
  }
}
