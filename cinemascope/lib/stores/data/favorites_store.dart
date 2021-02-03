part of 'data_store.dart';

class _FavoritesStore = _FavoritesStoreBase with _$_FavoritesStore;

abstract class _FavoritesStoreBase with Store {
  final TmdbService _tmdb = Modular.get<TmdbService>();

  // --------------------------------------------------------------------------
  // [[ FAVORITE MOVIES ]]
  // --------------------------------------------------------------------------
  AccountFavoriteMovies favoriteMovies;

  @observable
  ObservableFuture<AccountFavoriteMovies> fetchFavoriteMoviesFuture = _emptyFavoriteMovies;

  @computed
  bool get hasFavoriteMovies =>
      fetchFavoriteMoviesFuture != _emptyFavoriteMovies &&
      fetchFavoriteMoviesFuture.status == FutureStatus.fulfilled;

  @action
  Future<AccountFavoriteMovies> fetchFavoriteMovies() async {
    favoriteMovies = null;
    final future = _fetchFavoriteMovies();
    fetchFavoriteMoviesFuture = ObservableFuture(future);

    return favoriteMovies = await future;
  }

  Future<AccountFavoriteMovies> _fetchFavoriteMovies() async {
    AccountFavoriteMovies resp = AccountFavoriteMovies();
    do {
      resp = resp.mergeResults(
        await _tmdb.api.account.getFavoriteMovies(
          page: (resp.page ?? 0) + 1,
          language: TmdbConfig.language.language,
          sortBy: favoriteMoviesSortBy,
        ),
      );
    } while (resp.hasNextPage);
    return resp;
  }

  // --------------------------------------------------------------------------
  // [[ FAVORITE TVS ]]
  // --------------------------------------------------------------------------
  AccountFavoriteTvs favoriteTvs;

  @observable
  ObservableFuture<AccountFavoriteTvs> fetchFavoriteTvsFuture = _emptyFavoriteTvs;

  @computed
  bool get hasFavoriteTvs =>
      fetchFavoriteTvsFuture != _emptyFavoriteTvs &&
      fetchFavoriteTvsFuture.status == FutureStatus.fulfilled;

  @action
  Future<AccountFavoriteTvs> fetchFavoriteTvs() async {
    favoriteTvs = null;
    final future = _fetchFavoriteTvs();
    fetchFavoriteTvsFuture = ObservableFuture(future);

    return favoriteTvs = await future;
  }

  Future<AccountFavoriteTvs> _fetchFavoriteTvs() async {
    AccountFavoriteTvs resp = AccountFavoriteTvs();
    do {
      resp = resp.mergeResults(
        await _tmdb.api.account.getFavoriteTvs(
          page: (resp.page ?? 0) + 1,
          language: TmdbConfig.language.language,
          sortBy: favoriteTvsSortBy,
        ),
      );
    } while (resp.hasNextPage);
    return resp;
  }

  // --------------------------------------------------------------------------
  // [[ FAVORITE MOVIES SORT BY ]]
  // --------------------------------------------------------------------------
  @observable
  FavoriteMoviesSortBy favoriteMoviesSortBy = FavoriteMoviesSortBy.createdAt.asc;

  @action
  void toggleFavoriteMoviesSortBy() {
    favoriteMoviesSortBy = favoriteMoviesSortBy.order == SortOrder.asc
        ? favoriteMoviesSortBy.copy().desc
        : favoriteMoviesSortBy.copy().asc;
    fetchFavoriteMovies();
  }

  // --------------------------------------------------------------------------
  // [[ FAVORITE TVS SORT BY ]]
  // --------------------------------------------------------------------------
  @observable
  FavoriteTvsSortBy favoriteTvsSortBy = FavoriteTvsSortBy.createdAt.asc;

  @action
  void toggleFavoriteTvsSortBy() {
    favoriteTvsSortBy = favoriteTvsSortBy.order == SortOrder.asc
        ? favoriteTvsSortBy.copy().desc
        : favoriteTvsSortBy.copy().asc;
    fetchFavoriteTvs();
  }

  static final ObservableFuture<AccountFavoriteMovies> _emptyFavoriteMovies =
      ObservableFuture.value(null);

  static final ObservableFuture<AccountFavoriteTvs> _emptyFavoriteTvs =
      ObservableFuture.value(null);
}
