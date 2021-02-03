// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MediaStore<T> on _MediaStoreBase<T>, Store {
  Computed<bool> _$isFetchingDataComputed;

  @override
  bool get isFetchingData =>
      (_$isFetchingDataComputed ??= Computed<bool>(() => super.isFetchingData,
              name: '_MediaStoreBase.isFetchingData'))
          .value;
  Computed<bool> _$hasMediaDetailsComputed;

  @override
  bool get hasMediaDetails =>
      (_$hasMediaDetailsComputed ??= Computed<bool>(() => super.hasMediaDetails,
              name: '_MediaStoreBase.hasMediaDetails'))
          .value;
  Computed<bool> _$hasAccountStatesComputed;

  @override
  bool get hasAccountStates => (_$hasAccountStatesComputed ??= Computed<bool>(
          () => super.hasAccountStates,
          name: '_MediaStoreBase.hasAccountStates'))
      .value;
  Computed<bool> _$hasMediaListsComputed;

  @override
  bool get hasMediaLists =>
      (_$hasMediaListsComputed ??= Computed<bool>(() => super.hasMediaLists,
              name: '_MediaStoreBase.hasMediaLists'))
          .value;

  final _$fetchMediaDetailsFutureAtom =
      Atom(name: '_MediaStoreBase.fetchMediaDetailsFuture');

  @override
  ObservableFuture<T> get fetchMediaDetailsFuture {
    _$fetchMediaDetailsFutureAtom.reportRead();
    return super.fetchMediaDetailsFuture;
  }

  @override
  set fetchMediaDetailsFuture(ObservableFuture<T> value) {
    _$fetchMediaDetailsFutureAtom
        .reportWrite(value, super.fetchMediaDetailsFuture, () {
      super.fetchMediaDetailsFuture = value;
    });
  }

  final _$fetchAccountStatesFutureAtom =
      Atom(name: '_MediaStoreBase.fetchAccountStatesFuture');

  @override
  ObservableFuture<TAccountStates> get fetchAccountStatesFuture {
    _$fetchAccountStatesFutureAtom.reportRead();
    return super.fetchAccountStatesFuture;
  }

  @override
  set fetchAccountStatesFuture(ObservableFuture<TAccountStates> value) {
    _$fetchAccountStatesFutureAtom
        .reportWrite(value, super.fetchAccountStatesFuture, () {
      super.fetchAccountStatesFuture = value;
    });
  }

  final _$fetchMediaListsFutureAtom =
      Atom(name: '_MediaStoreBase.fetchMediaListsFuture');

  @override
  ObservableFuture<List<Account4ListsItem>> get fetchMediaListsFuture {
    _$fetchMediaListsFutureAtom.reportRead();
    return super.fetchMediaListsFuture;
  }

  @override
  set fetchMediaListsFuture(ObservableFuture<List<Account4ListsItem>> value) {
    _$fetchMediaListsFutureAtom.reportWrite(value, super.fetchMediaListsFuture,
        () {
      super.fetchMediaListsFuture = value;
    });
  }

  final _$mediaActionAtom = Atom(name: '_MediaStoreBase.mediaAction');

  @override
  MediaItemAction get mediaAction {
    _$mediaActionAtom.reportRead();
    return super.mediaAction;
  }

  @override
  set mediaAction(MediaItemAction value) {
    _$mediaActionAtom.reportWrite(value, super.mediaAction, () {
      super.mediaAction = value;
    });
  }

  final _$setFavoriteAsyncAction = AsyncAction('_MediaStoreBase.setFavorite');

  @override
  Future<void> setFavorite(bool value) {
    return _$setFavoriteAsyncAction.run(() => super.setFavorite(value));
  }

  final _$setWatchListAsyncAction = AsyncAction('_MediaStoreBase.setWatchList');

  @override
  Future<void> setWatchList(bool value) {
    return _$setWatchListAsyncAction.run(() => super.setWatchList(value));
  }

  final _$setRatingAsyncAction = AsyncAction('_MediaStoreBase.setRating');

  @override
  Future<void> setRating(double rating, bool clear) {
    return _$setRatingAsyncAction.run(() => super.setRating(rating, clear));
  }

  final _$setListsAsyncAction = AsyncAction('_MediaStoreBase.setLists');

  @override
  Future<void> setLists(
      List<Account4ListsItem> addTo, List<Account4ListsItem> removeFrom) {
    return _$setListsAsyncAction.run(() => super.setLists(addTo, removeFrom));
  }

  final _$_fetchMediaDetailsInternalAsyncAction =
      AsyncAction('_MediaStoreBase._fetchMediaDetailsInternal');

  @override
  Future<T> _fetchMediaDetailsInternal() {
    return _$_fetchMediaDetailsInternalAsyncAction
        .run(() => super._fetchMediaDetailsInternal());
  }

  final _$_fetchAccountStatesInternalAsyncAction =
      AsyncAction('_MediaStoreBase._fetchAccountStatesInternal');

  @override
  Future<TAccountStates> _fetchAccountStatesInternal() {
    return _$_fetchAccountStatesInternalAsyncAction
        .run(() => super._fetchAccountStatesInternal());
  }

  final _$fetchMediaListsAsyncAction =
      AsyncAction('_MediaStoreBase.fetchMediaLists');

  @override
  Future<List<Account4ListsItem>> fetchMediaLists() {
    return _$fetchMediaListsAsyncAction.run(() => super.fetchMediaLists());
  }

  final _$_MediaStoreBaseActionController =
      ActionController(name: '_MediaStoreBase');

  @override
  void _setMediaAction(MediaItemAction action) {
    final _$actionInfo = _$_MediaStoreBaseActionController.startAction(
        name: '_MediaStoreBase._setMediaAction');
    try {
      return super._setMediaAction(action);
    } finally {
      _$_MediaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchMediaDetailsFuture: ${fetchMediaDetailsFuture},
fetchAccountStatesFuture: ${fetchAccountStatesFuture},
fetchMediaListsFuture: ${fetchMediaListsFuture},
mediaAction: ${mediaAction},
isFetchingData: ${isFetchingData},
hasMediaDetails: ${hasMediaDetails},
hasAccountStates: ${hasAccountStates},
hasMediaLists: ${hasMediaLists}
    ''';
  }
}

mixin _$MovieStore on _MovieStoreBase, Store {
  @override
  String toString() {
    return '''

    ''';
  }
}

mixin _$PersonStore on _PersonStoreBase, Store {
  @override
  String toString() {
    return '''

    ''';
  }
}

mixin _$TvEpisodeStore on _TvEpisodeStoreBase, Store {
  @override
  String toString() {
    return '''

    ''';
  }
}

mixin _$TvSeasonStore on _TvSeasonStoreBase, Store {
  @override
  String toString() {
    return '''

    ''';
  }
}

mixin _$TvStore on _TvStoreBase, Store {
  @override
  String toString() {
    return '''

    ''';
  }
}
