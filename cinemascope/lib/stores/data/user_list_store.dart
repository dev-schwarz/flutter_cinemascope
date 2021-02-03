part of 'data_store.dart';

class _UserListStore = _UserListStoreBase with _$_UserListStore;

abstract class _UserListStoreBase with Store {
  _UserListStoreBase(this.listId) {
    sortIndex = List4SortBy.originalOrder.prefix.index;
    orderIndex = SortOrder.asc.index;
  }

  final TmdbService _tmdb = Modular.get<TmdbService>();

  final int listId;

  List4 list;

  @observable
  ObservableFuture<List4> fetchListFuture = _emptyList;

  @computed
  bool get hasList =>
      fetchListFuture != _emptyList && fetchListFuture.status == FutureStatus.fulfilled;

  @action
  Future<List4> fetchList() async {
    list = List4();
    final future = _fetchList();
    fetchListFuture = ObservableFuture(future);

    return list = await future;
  }

  @action
  Future<List4> fetchListNextPage() async {
    final future = _fetchList();
    fetchListFuture = ObservableFuture(future);

    return list = await future;
  }

  Future<List4> _fetchList() async {
    return list.mergeResults(
      await _tmdb.api.list4.getList(
        listId,
        page: (list?.page ?? 0) + 1,
        language: TmdbConfig.language.language,
        sortBy: currentSortBy,
      ),
    );
  }

  @observable
  int sortIndex;

  @action
  void setSortIndex(int value, {bool reloadList = true}) {
    sortIndex = value;
    if (reloadList) {
      fetchList();
    }
  }

  @observable
  int orderIndex;

  @action
  void toggleOrder({bool reloadList = true}) {
    orderIndex = orderIndex == SortOrder.asc.index ? SortOrder.desc.index : SortOrder.asc.index;
    if (reloadList) {
      fetchList();
    }
  }

  @computed
  List4SortBy get currentSortBy {
    final List4SortBy sortBy = List4SortBy.values[sortIndex];
    if (orderIndex == SortOrder.asc.index) {
      sortBy.asc;
    } else {
      sortBy.desc;
    }
    return sortBy.copy();
  }

  static final ObservableFuture<List4> _emptyList = ObservableFuture.value(null);
}
