part of 'buttons.dart';

class MediaListButton extends StatelessWidget {
  const MediaListButton({
    Key key,
    @required this.mediaStore,
    this.onChanged,
  })  : assert(mediaStore != null, 'mediaStore must not be null'),
        super(key: key);

  final MediaStore mediaStore;
  final Function(int, int) onChanged;

  @override
  Widget build(BuildContext context) {
    return _MediaButton(
      iconData: Icons.playlist_add,
      label: context.i18n.mediaButtons.playlist,
      tooltip: context.i18n.mediaButtons.playlistTooltip,
      onTap: () => _openListPage(context),
    );
  }

  void _openListPage(BuildContext context) {
    final Route route = PageRouteBuilder(
      pageBuilder: (_, __, ___) {
        return _ListPage(
          mediaStore: mediaStore,
          onCancel: () {
            Modular.to.pop();
          },
          onUpdate: (addTo, removeFrom) {
            Modular.to.pop();
            mediaStore.setLists(addTo, removeFrom);
          },
        );
      },
      fullscreenDialog: true,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        const begin = const Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );

    Modular.to.push(route);
  }
}

class _ListPage extends StatefulWidget {
  const _ListPage({
    Key key,
    @required this.mediaStore,
    @required this.onCancel,
    @required this.onUpdate,
    this.onChanged,
  })  : assert(mediaStore != null, 'mediaStore must not be null'),
        assert(onCancel != null, 'onCancel must not be null'),
        assert(onUpdate != null, 'onUpdate must not be null'),
        super(key: key);

  final MediaStore mediaStore;
  final VoidCallback onCancel;
  final Function(List<Account4ListsItem>, List<Account4ListsItem>) onUpdate;
  final Function(int, int) onChanged;

  @override
  __ListPageState createState() => __ListPageState();
}

class __ListPageState extends State<_ListPage> {
  MediaStore get _mediaStore => widget.mediaStore;

  List<Account4ListsItem> _addTo;
  List<Account4ListsItem> _removeFrom;
  // String _newListName;

  @override
  void initState() {
    super.initState();
    _addTo = [];
    _removeFrom = [];
    _mediaStore.fetchMediaLists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New List'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: widget.onCancel,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () => widget.onUpdate(_addTo, _removeFrom),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateListDialog,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // [[ user lists ]]
            Expanded(
              child: Observer(
                builder: (_) {
                  return !_mediaStore.hasMediaLists
                      ? const Center(
                          child: const CircularProgressIndicator(),
                        )
                      : ListView(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          children: _makeListsItemsTiles(),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _makeListsItemsTiles() {
    final listsTiles = _mediaStore.accountLists.results.map<Widget>((Account4ListsItem listItem) {
      // If the lists of this media contains the current list item
      final originalValue = _mediaStore.mediaLists.any(
        (Account4ListsItem mediaListItem) => mediaListItem.id == listItem.id,
      );

      return _ListCheckBoxTile(
        item: listItem,
        value: originalValue,
        onToggle: (newValue) {
          if (originalValue) {
            // exists in the original list
            if (newValue) {
              // do not change any list
              _addTo.remove(listItem);
              _removeFrom.remove(listItem);
            } else {
              _addTo.remove(listItem);
              _removeFrom.add(listItem);
            }
          } else {
            // do not exists in the original list
            if (!newValue) {
              // do not change any list
              _addTo.remove(listItem);
              _removeFrom.remove(listItem);
            } else {
              _addTo.add(listItem);
              _removeFrom.remove(listItem);
            }
          }
        },
      );
    }).toList();

    listsTiles.add(const SizedBox(height: 56.0));

    return listsTiles;
  }

  // Widget _makeCreateListButton() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //     child: RaisedButton(
  //       padding: const EdgeInsets.symmetric(vertical: 16.0),
  //       color: context.theme.scaffoldBackgroundColor.withOpacity(0.3),
  //       textColor: Colors.blue,
  //       onPressed: _showCreateListDialog,
  //       child: const Text('CREATE NEW LIST'),
  //     ),
  //   );
  // }

  Future<void> _showCreateListDialog() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => const RoundedDialog(
        // child: Container(
        //   child: Text('Teste'),
        // ),
        child: const Text('Teste'),
      ),
    );
  }
}

class _ListCheckBoxTile extends StatefulWidget {
  const _ListCheckBoxTile({
    Key key,
    @required this.item,
    @required this.value,
    @required this.onToggle,
  })  : assert(item != null, 'item must not be null'),
        assert(value != null, 'value must not be null'),
        assert(onToggle != null, 'onToggle must not be null'),
        super(key: key);

  final Account4ListsItem item;
  final bool value;
  final Function(bool) onToggle;

  @override
  __ListCheckBoxTileState createState() => __ListCheckBoxTileState();
}

class __ListCheckBoxTileState extends State<_ListCheckBoxTile> {
  bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.item.name),
      dense: false,
      value: _checked,
      activeColor: Colors.green,
      onChanged: (value) {
        setState(() {
          _checked = value;
        });
        widget.onToggle(value);
      },
    );
  }
}
