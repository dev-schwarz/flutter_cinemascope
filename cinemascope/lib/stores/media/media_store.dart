import 'package:flutter/foundation.dart' show required;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../models/tmdb_config_model.dart';
import '../../models/tmdb_resumed_media_model.dart';
import '../../services/tmdb_service.dart';
import '../data/data_store.dart';

part 'media_action.dart';
part 'media_store.g.dart';
part 'movie_store.dart';
part 'person_store.dart';
part 'tv_episode_store.dart';
part 'tv_season_store.dart';
part 'tv_store.dart';

abstract class MediaStore<T> = _MediaStoreBase<T> with _$MediaStore;

abstract class _MediaStoreBase<T> with Store {
  _MediaStoreBase({
    @required this.mediaType,
    // @required DataStore dataStore,
    bool autoFetch = true,
  })
  // : _dataStore = dataStore {
  {
    fetchMediaDetailsFuture = _emptyMediaDetails;
    if (autoFetch) {
      _fetchAllMediaData();
    }
  }

  final TmdbService _tmdb = Modular.get<TmdbService>();
  final DataStore _dataStore = Modular.get<DataStore>();

  final TMediaType mediaType;

  TmdbResumedMedia get resumedMedia => _resumedMedia;
  TmdbResumedMedia _resumedMedia;

  @computed
  bool get isFetchingData => !hasMediaDetails;

  // --------------------------------------------------------------------------
  // [[ MEDIA DETAILS ]]
  // --------------------------------------------------------------------------
  T mediaDetails;

  @observable
  ObservableFuture<T> fetchMediaDetailsFuture;

  @computed
  bool get hasMediaDetails =>
      fetchMediaDetailsFuture != _emptyMediaDetails &&
      fetchMediaDetailsFuture.status == FutureStatus.fulfilled;

  // --------------------------------------------------------------------------
  // [[ ACCOUNT STATES ]]
  // --------------------------------------------------------------------------
  /// The account states of the media.
  TAccountStates accountStates;

  @observable
  ObservableFuture<TAccountStates> fetchAccountStatesFuture = _emptyAccountStates;

  /// [accountStates] has been loaded.
  @computed
  bool get hasAccountStates =>
      fetchAccountStatesFuture != _emptyAccountStates &&
      fetchAccountStatesFuture.status == FutureStatus.fulfilled;

  /// [accountStates] has been already loaded and it's not null (empty).
  bool get hasAccountStatesData => hasAccountStates || accountStates != null;

  // --------------------------------------------------------------------------
  // [[ ACCOUNT LISTS ]]
  // --------------------------------------------------------------------------
  Account4Lists get accountLists => _dataStore.listsStore.userLists;

  // --------------------------------------------------------------------------
  // [[ MEDIA LISTS ]]
  // --------------------------------------------------------------------------
  List<Account4ListsItem> mediaLists;

  @computed
  bool get hasMediaLists =>
      fetchMediaListsFuture != _emptyMediaLists &&
      fetchMediaListsFuture.status == FutureStatus.fulfilled;

  @observable
  ObservableFuture<List<Account4ListsItem>> fetchMediaListsFuture = _emptyMediaLists;

  // --------------------------------------------------------------------------
  // [[ MEDIA ACTIONS ]]
  // --------------------------------------------------------------------------
  @observable
  MediaItemAction mediaAction;

  @action
  void _setMediaAction(MediaItemAction action) => mediaAction = action;

  @action
  Future<void> setFavorite(bool value) async {
    final resp = await _tmdb.api.account.markAsFavorite(
      _resumedMedia.id.toString(),
      _resumedMedia.mediaType.toString(),
      value,
    );

    if (resp.isSuccess) {
      accountStates = await _fetchAccountStatesInternal();
      _setMediaAction(MediaItemActionFavorite(value));
      if (_resumedMedia.mediaType == TMediaType.movie) {
        _dataStore.favoritesStore.fetchFavoriteMovies();
      } else if (_resumedMedia.mediaType == TMediaType.tv) {
        _dataStore.favoritesStore.fetchFavoriteTvs();
      }
    }
  }

  @action
  Future<void> setWatchList(bool value) async {
    final resp = await _tmdb.api.account.addToWatchlist(
      _resumedMedia.id.toString(),
      _resumedMedia.mediaType.toString(),
      value,
    );

    if (resp.isSuccess) {
      accountStates = await _fetchAccountStatesInternal();
      _setMediaAction(MediaItemActionWatchList(value));
      if (_resumedMedia.mediaType == TMediaType.movie) {
        _dataStore.watchListStore.fetchWatchListMovies();
      } else if (_resumedMedia.mediaType == TMediaType.tv) {
        _dataStore.watchListStore.fetchWatchListTvs();
      }
    }
  }

  @action
  Future<void> setRating(double rating, bool clear) async {
    MediaRatingObject resp;

    if (_resumedMedia.mediaType == TMediaType.movie) {
      if (clear) {
        resp = await _tmdb.api.movie.deleteMovieRating(_resumedMedia.id);
      } else {
        resp = await _tmdb.api.movie.rateMovie(_resumedMedia.id, rating);
      }
    } else if (_resumedMedia.mediaType == TMediaType.tv) {
      if (clear) {
        resp = await _tmdb.api.tv.deleteTvRating(_resumedMedia.id);
      } else {
        resp = await _tmdb.api.tv.rateTv(_resumedMedia.id, rating);
      }
    }

    if (resp.isSuccess) {
      await Future.delayed(const Duration(milliseconds: 1500));
      accountStates = await _fetchAccountStatesInternal();
      _setMediaAction(MediaItemActionRate(!clear, rating));
    }
  }

  @action
  Future<void> setLists(List<Account4ListsItem> addTo, List<Account4ListsItem> removeFrom) async {
    final items = [List4ListItem(mediaId: resumedMedia.id, mediaType: resumedMedia.mediaType)];

    if (addTo.isNotEmpty) {
      for (final list in addTo) {
        await _tmdb.api.list4.addItems(list.id, items);
        await _dataStore.listsStore.updateListDetails(list);
      }
      // addTo.forEach(
      //   (list) async {
      //     await _tmdb.api.list4.addItems(list.id, items);
      //     await _dataStore.listsStore.updateListDetails(list);
      //   },
      // );
    }

    if (removeFrom.isNotEmpty) {
      for (final list in removeFrom) {
        await _tmdb.api.list4.removeItems(list.id, items);
        await _dataStore.listsStore.updateListDetails(list);
      }
      // removeFrom.forEach(
      //   (list) async {
      //     await _tmdb.api.list4.removeItems(list.id, items);
      //     await _dataStore.listsStore.updateListDetails(list);
      //   },
      // );
    }

    if (addTo.isNotEmpty || removeFrom.isNotEmpty) {
      await _dataStore.listsStore.fetchUserLists();
      _setMediaAction(MediaItemActionLists(addTo.length, removeFrom.length));
    }
  }

  // --------------------------------------------------------------------------
  // [[ FETCH DATA ]]
  // --------------------------------------------------------------------------
  Future<void> _fetchAllMediaData() async {
    _fetchMediaDetailsInternal().then((m) {
      this.mediaDetails = m;
      _resumedMedia = _makeResumedMedia();
      _fetchAccountStatesInternal().then((a) {
        this.accountStates = a;
      });
    });
  }

  @action
  Future<T> _fetchMediaDetailsInternal() async {
    final future = _fetchMediaDetails();
    fetchMediaDetailsFuture = ObservableFuture(future);

    return future;
  }

  @action
  Future<TAccountStates> _fetchAccountStatesInternal() async {
    final future = _fetchAccountStates();
    fetchAccountStatesFuture = ObservableFuture(future);

    return future;
  }

  @action
  Future<List<Account4ListsItem>> fetchMediaLists() async {
    final future = _fetchMediaLists();
    fetchMediaListsFuture = ObservableFuture(future);

    return mediaLists = await future;
  }

  Future<List<Account4ListsItem>> _fetchMediaLists() async {
    final resp = _dataStore.listsStore.userLists.results.where(
      (listItem) {
        return _dataStore.listsStore.allListsDetails
            .firstWhere(
              (details) {
                return details.id == listItem.id;
              },
            )
            .results
            .any(
              (media) {
                return media.id == resumedMedia.id && media.mediaType == resumedMedia.mediaType;
              },
            );
      },
    ).toList();

    return resp;
  }

  Future<T> _fetchMediaDetails();

  Future<TAccountStates> _fetchAccountStates() => Future.value(null);

  TmdbResumedMedia _makeResumedMedia();

  final ObservableFuture<T> _emptyMediaDetails = ObservableFuture.value(null);

  static final ObservableFuture<TAccountStates> _emptyAccountStates = ObservableFuture.value(null);

  static final ObservableFuture<List<Account4ListsItem>> _emptyMediaLists =
      ObservableFuture.value([]);
}
