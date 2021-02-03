part of 'data_store.dart';

class _ListsStore = _ListsStoreBase with _$_ListsStore;

abstract class _ListsStoreBase with Store {
  final TmdbService _tmdb = Modular.get<TmdbService>();

  // --------------------------------------------------------------------------
  // [[ USER LISTS ]]
  // --------------------------------------------------------------------------
  Account4Lists userLists;

  @observable
  ObservableFuture<Account4Lists> fetchUserListsFuture = _emptyUserLists;

  @computed
  bool get hasUserLists =>
      fetchUserListsFuture != _emptyUserLists &&
      fetchUserListsFuture.status == FutureStatus.fulfilled;

  @action
  Future<Account4Lists> fetchUserLists() async {
    userLists = null;
    final future = _fetchUserLists();
    fetchUserListsFuture = ObservableFuture(future);

    return userLists = await future;
  }

  Future<Account4Lists> _fetchUserLists() async {
    Account4Lists resp = Account4Lists();
    do {
      resp = resp.mergeResults(
        await _tmdb.api.account4.getLists(
          page: (resp.page ?? 0) + 1,
          language: TmdbConfig.language.language,
        ),
      );
    } while (resp.hasNextPage);
    return resp;
  }

  static final ObservableFuture<Account4Lists> _emptyUserLists = ObservableFuture.value(null);

  // --------------------------------------------------------------------------
  // [[ ALL USER LISTS DETAILS ]]
  // --------------------------------------------------------------------------
  List<List4> allListsDetails;

  @observable
  ObservableFuture<List<List4>> fetchAllListsDetailsFuture = _emptyAllListsDetails;

  @computed
  bool get hasAllListsDetails =>
      fetchAllListsDetailsFuture != _emptyAllListsDetails &&
      fetchAllListsDetailsFuture.status == FutureStatus.fulfilled;

  @action
  Future<List<List4>> fetchAllListsDetails() async {
    allListsDetails = [];
    final future = _fetchAllListsDetails();
    fetchAllListsDetailsFuture = ObservableFuture(future);

    return allListsDetails = await future;
  }

  Future<List<List4>> _fetchAllListsDetails() async {
    final List<List4> resp = <List4>[];
    for (final Account4ListsItem item in userLists.results) {
      resp.add(await _fetchListDetails(item));
    }
    return resp;
  }

  Future<List4> _fetchListDetails(Account4ListsItem listItem) async {
    List4 resp = List4();
    do {
      resp = resp.mergeResults(
        await _tmdb.api.list4.getList(
          listItem.id,
          page: (resp.page ?? 0) + 1,
          language: TmdbConfig.language.language,
        ),
      );
    } while (resp.hasNextPage);
    return resp;
  }

  @action
  Future<void> updateListDetails(Account4ListsItem listItem) async {
    final newItem = await _fetchListDetails(listItem);
    final List4 currentItem = allListsDetails.firstWhere((e) => e.id == listItem.id);
    final index = allListsDetails.indexOf(currentItem);
    allListsDetails.removeAt(index);
    allListsDetails.insert(index, newItem);
  }

  static final ObservableFuture<List<List4>> _emptyAllListsDetails = ObservableFuture.value([]);
}
