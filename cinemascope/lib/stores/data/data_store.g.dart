// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DataStore on _DataStoreBase, Store {
  Computed<bool> _$userListStoreActiveComputed;

  @override
  bool get userListStoreActive => (_$userListStoreActiveComputed ??=
          Computed<bool>(() => super.userListStoreActive,
              name: '_DataStoreBase.userListStoreActive'))
      .value;

  final _$isFetchingDataAtom = Atom(name: '_DataStoreBase.isFetchingData');

  @override
  bool get isFetchingData {
    _$isFetchingDataAtom.reportRead();
    return super.isFetchingData;
  }

  @override
  set isFetchingData(bool value) {
    _$isFetchingDataAtom.reportWrite(value, super.isFetchingData, () {
      super.isFetchingData = value;
    });
  }

  final _$isInitializedAtom = Atom(name: '_DataStoreBase.isInitialized');

  @override
  bool get isInitialized {
    _$isInitializedAtom.reportRead();
    return super.isInitialized;
  }

  @override
  set isInitialized(bool value) {
    _$isInitializedAtom.reportWrite(value, super.isInitialized, () {
      super.isInitialized = value;
    });
  }

  final _$fetchAllDataAsyncAction = AsyncAction('_DataStoreBase.fetchAllData');

  @override
  Future<void> fetchAllData() {
    return _$fetchAllDataAsyncAction.run(() => super.fetchAllData());
  }

  final _$_DataStoreBaseActionController =
      ActionController(name: '_DataStoreBase');

  @override
  void activateUserListStore(int listId) {
    final _$actionInfo = _$_DataStoreBaseActionController.startAction(
        name: '_DataStoreBase.activateUserListStore');
    try {
      return super.activateUserListStore(listId);
    } finally {
      _$_DataStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deactivateUserListStore() {
    final _$actionInfo = _$_DataStoreBaseActionController.startAction(
        name: '_DataStoreBase.deactivateUserListStore');
    try {
      return super.deactivateUserListStore();
    } finally {
      _$_DataStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFetchingData: ${isFetchingData},
isInitialized: ${isInitialized},
userListStoreActive: ${userListStoreActive}
    ''';
  }
}

mixin _$_FavoritesStore on _FavoritesStoreBase, Store {
  Computed<bool> _$hasFavoriteMoviesComputed;

  @override
  bool get hasFavoriteMovies => (_$hasFavoriteMoviesComputed ??= Computed<bool>(
          () => super.hasFavoriteMovies,
          name: '_FavoritesStoreBase.hasFavoriteMovies'))
      .value;
  Computed<bool> _$hasFavoriteTvsComputed;

  @override
  bool get hasFavoriteTvs =>
      (_$hasFavoriteTvsComputed ??= Computed<bool>(() => super.hasFavoriteTvs,
              name: '_FavoritesStoreBase.hasFavoriteTvs'))
          .value;

  final _$fetchFavoriteMoviesFutureAtom =
      Atom(name: '_FavoritesStoreBase.fetchFavoriteMoviesFuture');

  @override
  ObservableFuture<AccountFavoriteMovies> get fetchFavoriteMoviesFuture {
    _$fetchFavoriteMoviesFutureAtom.reportRead();
    return super.fetchFavoriteMoviesFuture;
  }

  @override
  set fetchFavoriteMoviesFuture(ObservableFuture<AccountFavoriteMovies> value) {
    _$fetchFavoriteMoviesFutureAtom
        .reportWrite(value, super.fetchFavoriteMoviesFuture, () {
      super.fetchFavoriteMoviesFuture = value;
    });
  }

  final _$fetchFavoriteTvsFutureAtom =
      Atom(name: '_FavoritesStoreBase.fetchFavoriteTvsFuture');

  @override
  ObservableFuture<AccountFavoriteTvs> get fetchFavoriteTvsFuture {
    _$fetchFavoriteTvsFutureAtom.reportRead();
    return super.fetchFavoriteTvsFuture;
  }

  @override
  set fetchFavoriteTvsFuture(ObservableFuture<AccountFavoriteTvs> value) {
    _$fetchFavoriteTvsFutureAtom
        .reportWrite(value, super.fetchFavoriteTvsFuture, () {
      super.fetchFavoriteTvsFuture = value;
    });
  }

  final _$favoriteMoviesSortByAtom =
      Atom(name: '_FavoritesStoreBase.favoriteMoviesSortBy');

  @override
  FavoriteMoviesSortBy get favoriteMoviesSortBy {
    _$favoriteMoviesSortByAtom.reportRead();
    return super.favoriteMoviesSortBy;
  }

  @override
  set favoriteMoviesSortBy(FavoriteMoviesSortBy value) {
    _$favoriteMoviesSortByAtom.reportWrite(value, super.favoriteMoviesSortBy,
        () {
      super.favoriteMoviesSortBy = value;
    });
  }

  final _$favoriteTvsSortByAtom =
      Atom(name: '_FavoritesStoreBase.favoriteTvsSortBy');

  @override
  FavoriteTvsSortBy get favoriteTvsSortBy {
    _$favoriteTvsSortByAtom.reportRead();
    return super.favoriteTvsSortBy;
  }

  @override
  set favoriteTvsSortBy(FavoriteTvsSortBy value) {
    _$favoriteTvsSortByAtom.reportWrite(value, super.favoriteTvsSortBy, () {
      super.favoriteTvsSortBy = value;
    });
  }

  final _$fetchFavoriteMoviesAsyncAction =
      AsyncAction('_FavoritesStoreBase.fetchFavoriteMovies');

  @override
  Future<AccountFavoriteMovies> fetchFavoriteMovies() {
    return _$fetchFavoriteMoviesAsyncAction
        .run(() => super.fetchFavoriteMovies());
  }

  final _$fetchFavoriteTvsAsyncAction =
      AsyncAction('_FavoritesStoreBase.fetchFavoriteTvs');

  @override
  Future<AccountFavoriteTvs> fetchFavoriteTvs() {
    return _$fetchFavoriteTvsAsyncAction.run(() => super.fetchFavoriteTvs());
  }

  final _$_FavoritesStoreBaseActionController =
      ActionController(name: '_FavoritesStoreBase');

  @override
  void toggleFavoriteMoviesSortBy() {
    final _$actionInfo = _$_FavoritesStoreBaseActionController.startAction(
        name: '_FavoritesStoreBase.toggleFavoriteMoviesSortBy');
    try {
      return super.toggleFavoriteMoviesSortBy();
    } finally {
      _$_FavoritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFavoriteTvsSortBy() {
    final _$actionInfo = _$_FavoritesStoreBaseActionController.startAction(
        name: '_FavoritesStoreBase.toggleFavoriteTvsSortBy');
    try {
      return super.toggleFavoriteTvsSortBy();
    } finally {
      _$_FavoritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchFavoriteMoviesFuture: ${fetchFavoriteMoviesFuture},
fetchFavoriteTvsFuture: ${fetchFavoriteTvsFuture},
favoriteMoviesSortBy: ${favoriteMoviesSortBy},
favoriteTvsSortBy: ${favoriteTvsSortBy},
hasFavoriteMovies: ${hasFavoriteMovies},
hasFavoriteTvs: ${hasFavoriteTvs}
    ''';
  }
}

mixin _$_ListsStore on _ListsStoreBase, Store {
  Computed<bool> _$hasUserListsComputed;

  @override
  bool get hasUserLists =>
      (_$hasUserListsComputed ??= Computed<bool>(() => super.hasUserLists,
              name: '_ListsStoreBase.hasUserLists'))
          .value;
  Computed<bool> _$hasAllListsDetailsComputed;

  @override
  bool get hasAllListsDetails => (_$hasAllListsDetailsComputed ??=
          Computed<bool>(() => super.hasAllListsDetails,
              name: '_ListsStoreBase.hasAllListsDetails'))
      .value;

  final _$fetchUserListsFutureAtom =
      Atom(name: '_ListsStoreBase.fetchUserListsFuture');

  @override
  ObservableFuture<Account4Lists> get fetchUserListsFuture {
    _$fetchUserListsFutureAtom.reportRead();
    return super.fetchUserListsFuture;
  }

  @override
  set fetchUserListsFuture(ObservableFuture<Account4Lists> value) {
    _$fetchUserListsFutureAtom.reportWrite(value, super.fetchUserListsFuture,
        () {
      super.fetchUserListsFuture = value;
    });
  }

  final _$fetchAllListsDetailsFutureAtom =
      Atom(name: '_ListsStoreBase.fetchAllListsDetailsFuture');

  @override
  ObservableFuture<List<List4<ResumedMedia>>> get fetchAllListsDetailsFuture {
    _$fetchAllListsDetailsFutureAtom.reportRead();
    return super.fetchAllListsDetailsFuture;
  }

  @override
  set fetchAllListsDetailsFuture(
      ObservableFuture<List<List4<ResumedMedia>>> value) {
    _$fetchAllListsDetailsFutureAtom
        .reportWrite(value, super.fetchAllListsDetailsFuture, () {
      super.fetchAllListsDetailsFuture = value;
    });
  }

  final _$fetchUserListsAsyncAction =
      AsyncAction('_ListsStoreBase.fetchUserLists');

  @override
  Future<Account4Lists> fetchUserLists() {
    return _$fetchUserListsAsyncAction.run(() => super.fetchUserLists());
  }

  final _$fetchAllListsDetailsAsyncAction =
      AsyncAction('_ListsStoreBase.fetchAllListsDetails');

  @override
  Future<List<List4<ResumedMedia>>> fetchAllListsDetails() {
    return _$fetchAllListsDetailsAsyncAction
        .run(() => super.fetchAllListsDetails());
  }

  final _$updateListDetailsAsyncAction =
      AsyncAction('_ListsStoreBase.updateListDetails');

  @override
  Future<void> updateListDetails(Account4ListsItem listItem) {
    return _$updateListDetailsAsyncAction
        .run(() => super.updateListDetails(listItem));
  }

  @override
  String toString() {
    return '''
fetchUserListsFuture: ${fetchUserListsFuture},
fetchAllListsDetailsFuture: ${fetchAllListsDetailsFuture},
hasUserLists: ${hasUserLists},
hasAllListsDetails: ${hasAllListsDetails}
    ''';
  }
}

mixin _$_UserListStore on _UserListStoreBase, Store {
  Computed<bool> _$hasListComputed;

  @override
  bool get hasList => (_$hasListComputed ??= Computed<bool>(() => super.hasList,
          name: '_UserListStoreBase.hasList'))
      .value;
  Computed<List4SortBy> _$currentSortByComputed;

  @override
  List4SortBy get currentSortBy => (_$currentSortByComputed ??=
          Computed<List4SortBy>(() => super.currentSortBy,
              name: '_UserListStoreBase.currentSortBy'))
      .value;

  final _$fetchListFutureAtom =
      Atom(name: '_UserListStoreBase.fetchListFuture');

  @override
  ObservableFuture<List4<ResumedMedia>> get fetchListFuture {
    _$fetchListFutureAtom.reportRead();
    return super.fetchListFuture;
  }

  @override
  set fetchListFuture(ObservableFuture<List4<ResumedMedia>> value) {
    _$fetchListFutureAtom.reportWrite(value, super.fetchListFuture, () {
      super.fetchListFuture = value;
    });
  }

  final _$sortIndexAtom = Atom(name: '_UserListStoreBase.sortIndex');

  @override
  int get sortIndex {
    _$sortIndexAtom.reportRead();
    return super.sortIndex;
  }

  @override
  set sortIndex(int value) {
    _$sortIndexAtom.reportWrite(value, super.sortIndex, () {
      super.sortIndex = value;
    });
  }

  final _$orderIndexAtom = Atom(name: '_UserListStoreBase.orderIndex');

  @override
  int get orderIndex {
    _$orderIndexAtom.reportRead();
    return super.orderIndex;
  }

  @override
  set orderIndex(int value) {
    _$orderIndexAtom.reportWrite(value, super.orderIndex, () {
      super.orderIndex = value;
    });
  }

  final _$fetchListAsyncAction = AsyncAction('_UserListStoreBase.fetchList');

  @override
  Future<List4<ResumedMedia>> fetchList() {
    return _$fetchListAsyncAction.run(() => super.fetchList());
  }

  final _$fetchListNextPageAsyncAction =
      AsyncAction('_UserListStoreBase.fetchListNextPage');

  @override
  Future<List4<ResumedMedia>> fetchListNextPage() {
    return _$fetchListNextPageAsyncAction.run(() => super.fetchListNextPage());
  }

  final _$_UserListStoreBaseActionController =
      ActionController(name: '_UserListStoreBase');

  @override
  void setSortIndex(int value, {bool reloadList = true}) {
    final _$actionInfo = _$_UserListStoreBaseActionController.startAction(
        name: '_UserListStoreBase.setSortIndex');
    try {
      return super.setSortIndex(value, reloadList: reloadList);
    } finally {
      _$_UserListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleOrder({bool reloadList = true}) {
    final _$actionInfo = _$_UserListStoreBaseActionController.startAction(
        name: '_UserListStoreBase.toggleOrder');
    try {
      return super.toggleOrder(reloadList: reloadList);
    } finally {
      _$_UserListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchListFuture: ${fetchListFuture},
sortIndex: ${sortIndex},
orderIndex: ${orderIndex},
hasList: ${hasList},
currentSortBy: ${currentSortBy}
    ''';
  }
}

mixin _$_WatchListStore on _WatchListStoreBase, Store {
  Computed<bool> _$hasWatchListMoviesComputed;

  @override
  bool get hasWatchListMovies => (_$hasWatchListMoviesComputed ??=
          Computed<bool>(() => super.hasWatchListMovies,
              name: '_WatchListStoreBase.hasWatchListMovies'))
      .value;
  Computed<bool> _$hasWatchListTvsComputed;

  @override
  bool get hasWatchListTvs =>
      (_$hasWatchListTvsComputed ??= Computed<bool>(() => super.hasWatchListTvs,
              name: '_WatchListStoreBase.hasWatchListTvs'))
          .value;

  final _$fetchWatchListMoviesFutureAtom =
      Atom(name: '_WatchListStoreBase.fetchWatchListMoviesFuture');

  @override
  ObservableFuture<AccountWatchListMovies> get fetchWatchListMoviesFuture {
    _$fetchWatchListMoviesFutureAtom.reportRead();
    return super.fetchWatchListMoviesFuture;
  }

  @override
  set fetchWatchListMoviesFuture(
      ObservableFuture<AccountWatchListMovies> value) {
    _$fetchWatchListMoviesFutureAtom
        .reportWrite(value, super.fetchWatchListMoviesFuture, () {
      super.fetchWatchListMoviesFuture = value;
    });
  }

  final _$fetchWatchListTvsFutureAtom =
      Atom(name: '_WatchListStoreBase.fetchWatchListTvsFuture');

  @override
  ObservableFuture<AccountWatchListTvs> get fetchWatchListTvsFuture {
    _$fetchWatchListTvsFutureAtom.reportRead();
    return super.fetchWatchListTvsFuture;
  }

  @override
  set fetchWatchListTvsFuture(ObservableFuture<AccountWatchListTvs> value) {
    _$fetchWatchListTvsFutureAtom
        .reportWrite(value, super.fetchWatchListTvsFuture, () {
      super.fetchWatchListTvsFuture = value;
    });
  }

  final _$watchListMoviesSortByAtom =
      Atom(name: '_WatchListStoreBase.watchListMoviesSortBy');

  @override
  WatchListMoviesSortBy get watchListMoviesSortBy {
    _$watchListMoviesSortByAtom.reportRead();
    return super.watchListMoviesSortBy;
  }

  @override
  set watchListMoviesSortBy(WatchListMoviesSortBy value) {
    _$watchListMoviesSortByAtom.reportWrite(value, super.watchListMoviesSortBy,
        () {
      super.watchListMoviesSortBy = value;
    });
  }

  final _$watchListTvsSortByAtom =
      Atom(name: '_WatchListStoreBase.watchListTvsSortBy');

  @override
  WatchListTvsSortBy get watchListTvsSortBy {
    _$watchListTvsSortByAtom.reportRead();
    return super.watchListTvsSortBy;
  }

  @override
  set watchListTvsSortBy(WatchListTvsSortBy value) {
    _$watchListTvsSortByAtom.reportWrite(value, super.watchListTvsSortBy, () {
      super.watchListTvsSortBy = value;
    });
  }

  final _$fetchWatchListMoviesAsyncAction =
      AsyncAction('_WatchListStoreBase.fetchWatchListMovies');

  @override
  Future<AccountWatchListMovies> fetchWatchListMovies() {
    return _$fetchWatchListMoviesAsyncAction
        .run(() => super.fetchWatchListMovies());
  }

  final _$fetchWatchListTvsAsyncAction =
      AsyncAction('_WatchListStoreBase.fetchWatchListTvs');

  @override
  Future<AccountWatchListTvs> fetchWatchListTvs() {
    return _$fetchWatchListTvsAsyncAction.run(() => super.fetchWatchListTvs());
  }

  final _$_WatchListStoreBaseActionController =
      ActionController(name: '_WatchListStoreBase');

  @override
  void toggleWatchListMoviesSortBy() {
    final _$actionInfo = _$_WatchListStoreBaseActionController.startAction(
        name: '_WatchListStoreBase.toggleWatchListMoviesSortBy');
    try {
      return super.toggleWatchListMoviesSortBy();
    } finally {
      _$_WatchListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleWatchListTvsSortBy() {
    final _$actionInfo = _$_WatchListStoreBaseActionController.startAction(
        name: '_WatchListStoreBase.toggleWatchListTvsSortBy');
    try {
      return super.toggleWatchListTvsSortBy();
    } finally {
      _$_WatchListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchWatchListMoviesFuture: ${fetchWatchListMoviesFuture},
fetchWatchListTvsFuture: ${fetchWatchListTvsFuture},
watchListMoviesSortBy: ${watchListMoviesSortBy},
watchListTvsSortBy: ${watchListTvsSortBy},
hasWatchListMovies: ${hasWatchListMovies},
hasWatchListTvs: ${hasWatchListTvs}
    ''';
  }
}
