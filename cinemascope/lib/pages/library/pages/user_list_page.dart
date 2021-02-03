import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../global/app_constants.dart';
import '../../../material.dart';
import '../../../stores/data/data_store.dart';
import '../widgets/library_app_bar_title.dart';

class UserListPage extends StatefulWidget {
  const UserListPage(this.list, {Key key})
      : assert(list != null, 'list must not be null'),
        super(key: key);

  final Account4ListsItem list;

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  DataStore _dataStore;

  @override
  void initState() {
    super.initState();
    _dataStore = context.dataStore;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dataStore.activateUserListStore(widget.list.id);
    _dataStore.userListStore.fetchList();
  }

  @override
  Widget build(BuildContext context) {
    final userListStore = _dataStore.userListStore;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppConstants.kAppAppBarTitleSpacing,
        title: Observer(
          builder: (_) {
            return LibraryAppBarTitle(
              title: widget.list.name,
              listSize: userListStore.hasList ? userListStore.list.totalResults : 0,
            );
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          if (!userListStore.hasList) {
            return const BigLoadingIndicator(
              iconData: Icons.list,
              title: 'Loading',
              message: 'User List',
            );
          }

          return Column(
            children: [
              const _SortBySelector(),
              Expanded(
                child: ResultsView<List4>(
                  content: userListStore.list,
                  handleRefresh: userListStore.fetchList,
                  loadNextPage: userListStore.fetchListNextPage,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _dataStore.deactivateUserListStore();
    super.dispose();
  }
}

class _SortBySelector extends StatelessWidget {
  const _SortBySelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8.0,
      child: Container(
        height: 56.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        margin: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sort by:',
              style: context.theme.textTheme.bodyText1,
            ),
            _hSpacer,
            _makeSortDropdown(context),
            Expanded(child: Container()),
            _hSpacer,
            Text(
              'Order:',
              style: context.theme.textTheme.bodyText1,
            ),
            _hSpacer,
            _makeOrderButton(context),
          ],
        ),
      ),
    );
  }

  Widget _makeSortDropdown(BuildContext context) {
    return Observer(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.only(top: 1.0),
          child: DropdownButton<int>(
            value: context.dataStore.userListStore.sortIndex,
            isDense: true,
            elevation: 0,
            underline: Container(
              height: 0.5,
              color: Colors.grey,
            ),
            style: context.theme.textTheme.bodyText1,
            onChanged: context.dataStore.userListStore.setSortIndex,
            items: _generateSortDropdownOptions(context),
          ),
        );
      },
    );
  }

  List<DropdownMenuItem> _generateSortDropdownOptions(BuildContext context) {
    return List<DropdownMenuItem<int>>.generate(
      _sortValues.length,
      (index) {
        return DropdownMenuItem<int>(
          value: _sortValues[index],
          child: Container(
            width: 100.0,
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(_sortTexts[index]),
          ),
        );
      },
      growable: false,
    );
  }

  Widget _makeOrderButton(BuildContext context) {
    return Observer(
      builder: (_) {
        return ActionChip(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          onPressed: context.dataStore.userListStore.toggleOrder,
          label: SizedBox(
            width: 50.0,
            child: Text(
              _orderTexts[context.dataStore.userListStore.orderIndex],
              textAlign: TextAlign.center,
              style: context.theme.textTheme.bodyText1,
            ),
          ),
        );
      },
    );
  }

  static const _hSpacer = const SizedBox(width: 8.0);

  static const _sortTexts = <String>[
    'Original order',
    'Release date',
    'Title',
    'Vote average',
  ];

  static const _orderTexts = <String>[
    'Asc',
    'Desc',
  ];

  static final _sortValues = <int>[
    List4SortBy.originalOrder.prefix.index,
    List4SortBy.releaseDate.prefix.index,
    List4SortBy.title.prefix.index,
    List4SortBy.voteAverage.prefix.index,
  ];
}
