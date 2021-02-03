import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../models/tmdb_config_model.dart';
import '../../services/tmdb_service.dart';

part 'data_store.g.dart';
part 'favorites_store.dart';
part 'lists_store.dart';
part 'user_list_store.dart';
part 'watch_list_store.dart';

class DataStore = _DataStoreBase with _$DataStore;

abstract class _DataStoreBase with Store {
  final _FavoritesStore favoritesStore = _FavoritesStore();

  final _WatchListStore watchListStore = _WatchListStore();

  final _ListsStore listsStore = _ListsStore();

  _UserListStore userListStore;

  @action
  void activateUserListStore(int listId) {
    userListStore = _UserListStore(listId);
  }

  @action
  void deactivateUserListStore() {
    userListStore = null;
  }

  @computed
  bool get userListStoreActive => userListStore != null;

  @observable
  bool isFetchingData = false;

  @observable
  bool isInitialized = false;

  @action
  Future<void> fetchAllData() async {
    isFetchingData = true;

    await favoritesStore.fetchFavoriteMovies();
    await favoritesStore.fetchFavoriteTvs();
    await watchListStore.fetchWatchListMovies();
    await watchListStore.fetchWatchListTvs();
    await listsStore.fetchUserLists();
    await listsStore.fetchAllListsDetails();

    isFetchingData = false;
    if (!isInitialized) {
      isInitialized = true;
    }
  }
}
