part of 'results_store.dart';

class DiscoverMoviesStore = _DiscoverMoviesStoreBase with _$DiscoverMoviesStore;

abstract class _DiscoverMoviesStoreBase extends ResultsStore<DiscoverMovie> with Store {
  _DiscoverMoviesStoreBase({double initialAnimationValue = 0.0}) : super(autoFetch: false) {
    filters = DiscoverMoviesFilters();
    filterStore = DiscoverMoviesFilterStore.init(filters);
    viewStore = DiscoverMoviesViewStore(initialAnimationValue);
  }

  @observable
  DiscoverMoviesFilters filters;

  @action
  void setFilters(DiscoverMoviesFilters filters) => this.filters = filters;

  @observable
  DiscoverMoviesViewStore viewStore;

  @observable
  DiscoverMoviesFilterStore filterStore;

  @action
  void setFilterStore(DiscoverMoviesFilterStore filterStore) => this.filterStore = filterStore;

  void resetFilterStore() => filterStore.setValues(filters);

  void applySetupFilter() {
    setFilters(
      filters.copyWith(
        sortBy: filterStore.sortBy.copy(),
        year: filterStore.year,
      ),
    );
  }

  ReactionDisposer _reactionDisposer;

  void setupReactions() {
    _reactionDisposer = reaction((_) => filters, (_) => fetchResults());
  }

  void dispose() {
    _reactionDisposer();
  }

  @override
  Future<DiscoverMovie> _fetchResultsInternal() {
    return _tmdb.api.discover
        .movieDiscover(
          page: (results?.page ?? 0) + 1,
          language: TmdbConfig.language.language,
          sortBy: filters.sortBy,
          primaryReleaseYear: int.tryParse(filters.primaryReleaseYear),
          year: int.tryParse(filters.year),
          releaseDateGte: filters.releaseDateGte,
          releaseDateLte: filters.releaseDateLte,
          voteCountGte: int.tryParse(filters.voteCountGte),
          voteCountLte: int.tryParse(filters.voteCountLte),
          voteAverageGte: num.tryParse(filters.voteAverageGte),
          voteAverageLte: num.tryParse(filters.voteAverageLte),
        )
        .then((value) => value);
  }
}

class DiscoverMoviesFilterStore = _DiscoverMoviesFilterStoreBase with _$DiscoverMoviesFilterStore;

abstract class _DiscoverMoviesFilterStoreBase with Store {
  _DiscoverMoviesFilterStoreBase();

  _DiscoverMoviesFilterStoreBase.init(DiscoverMoviesFilters filters) {
    setValues(filters);
  }

  void setValues(DiscoverMoviesFilters filters) {
    sortBy = filters.sortBy.copy();
    primaryReleaseYear = filters.primaryReleaseYear;
    year = filters.year;
    releaseDateGte = filters.releaseDateGte;
    releaseDateLte = filters.releaseDateLte;
    voteCountGte = filters.voteCountGte;
    voteCountLte = filters.voteCountLte;
    voteAverageGte = filters.voteAverageGte;
    voteAverageLte = filters.voteAverageLte;
  }

  @observable
  DiscoverMovieSortBy sortBy;

  @action
  void setSortBy(DiscoverMovieSortBy sortBy) => this.sortBy = sortBy;

  @observable
  String primaryReleaseYear;

  @action
  void setPrimaryReleaseYear(String value) => primaryReleaseYear = value;

  @computed
  bool get primaryReleaseYearValid =>
      _isNullOrEmpty(primaryReleaseYear) || RegExpUtils.isYear(primaryReleaseYear);

  @observable
  String year;

  @action
  void setYear(String value) => year = value;

  @computed
  bool get yearValid => _isNullOrEmpty(year) || RegExpUtils.isYear(year);

  @observable
  String releaseDateGte;

  @action
  void setReleaseDateGte(String value) => releaseDateGte = value;

  @computed
  bool get releaseDateGteValid =>
      _isNullOrEmpty(releaseDateGte) || RegExpUtils.isYear(releaseDateGte);

  @observable
  String releaseDateLte;

  @action
  void setReleaseDateLte(String value) => releaseDateLte = value;

  @computed
  bool get releaseDateLteValid =>
      _isNullOrEmpty(releaseDateLte) || RegExpUtils.isYear(releaseDateLte);

  @observable
  String voteCountGte;

  @action
  void setVoteCountGte(String value) => voteCountGte = value;

  @computed
  bool get voteCountGteValid => _isNullOrEmpty(voteCountGte) || int.tryParse(voteCountGte) != null;

  @observable
  String voteCountLte;

  @action
  void setVoteCountLte(String value) => voteCountLte = value;

  @computed
  bool get voteCountLteValid => _isNullOrEmpty(voteCountLte) || int.tryParse(voteCountLte) != null;

  @observable
  String voteAverageGte;

  @action
  void setVoteAverageGte(String value) => voteAverageGte = value;

  @computed
  bool get voteAverageGteValid =>
      _isNullOrEmpty(voteAverageGte) || num.tryParse(voteAverageGte) != null;

  @observable
  String voteAverageLte;

  @action
  void setVoteAverageLte(String value) => voteAverageLte = value;

  @computed
  bool get voteAverageLteValid =>
      _isNullOrEmpty(voteAverageLte) || num.tryParse(voteAverageLte) != null;

  @computed
  bool get formValid =>
      primaryReleaseYearValid &&
      yearValid &&
      releaseDateGteValid &&
      releaseDateLteValid &&
      voteCountGteValid &&
      voteCountLteValid &&
      voteAverageGteValid &&
      voteAverageLteValid;

  static bool _isNullOrEmpty(String value) => value?.isEmpty ?? true;
}

class DiscoverMoviesViewStore = _DiscoverMoviesViewStoreBase with _$DiscoverMoviesViewStore;

abstract class _DiscoverMoviesViewStoreBase with Store {
  _DiscoverMoviesViewStoreBase(double animationValue) {
    setAnimationValue(animationValue);
  }

  @observable
  bool setupMode;

  @observable
  double opacity;

  @observable
  double closeButtonOpacity;

  @observable
  double actionIconOpacity;

  @observable
  IconData actionIconData;

  @observable
  double setupDialogOpacity;

  @computed
  bool get isAnimating => opacity != 0.0 && opacity != 1.0;

  @action
  void setAnimationValue(double value) {
    opacity = value;
    // setup is considered visible when passed the half of the animation
    setupMode = value >= 0.5;
    // opacity value of the setup dialog background is 90%
    setupDialogOpacity = value * 0.9;
    if (setupMode) {
      actionIconData = Icons.check;
      closeButtonOpacity = actionIconOpacity = (value - 0.5) * 2.0;
    } else {
      actionIconData = Icons.sort;
      actionIconOpacity = ((value - 1.0) * 2.0).abs() - 1.0;
      closeButtonOpacity = 0.0;
    }
  }
}
