part of 'discover_movies_setup.dart';

class _DiscoverMoviesSortSelector extends StatelessWidget {
  const _DiscoverMoviesSortSelector(this.filterStore, {Key key}) : super(key: key);

  final DiscoverMoviesFilterStore filterStore;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Wrap(
            runSpacing: 10.0,
            spacing: 10.0,
            children: _sortChips(context),
          ),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: _orderChip(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _sortChips(BuildContext context) {
    return List<Widget>.generate(_sortValues.length, (index) {
      return Observer(
        builder: (_) {
          final currentOrder = filterStore.sortBy.order;
          final currentPrefixIndex = filterStore.sortBy.prefix.index;
          final isSelected = index == _sortValues.indexWhere((idx) => idx == currentPrefixIndex);
          final sortBy = DiscoverMovieSortBy.values[_sortValues[index]];

          return ChoiceChip(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            selectedColor: Colors.blue[900],
            labelStyle: _getTextStyle(context, isSelected),
            selected: isSelected,
            onSelected: (selected) => filterStore.setSortBy(
              (selected ? sortBy : DiscoverMovieSortBy.none)..order = currentOrder,
            ),
            label: SizedBox(
              height: 50.0,
              width: 90.0,
              child: Center(
                child: Text(
                  context.i18n.pages.discoverMovies.sortText(sortBy),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget _orderChip(BuildContext context) {
    return Observer(
      builder: (_) {
        return ActionChip(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          backgroundColor: Colors.blue[900],
          labelStyle: _getTextStyle(context, true),
          onPressed: () {
            final SortOrder order =
                filterStore.sortBy.order == SortOrder.asc ? SortOrder.desc : SortOrder.asc;
            filterStore.setSortBy(
              filterStore.sortBy.copy()..order = order,
            );
          },
          label: SizedBox(
            height: 50.0,
            width: 180.0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    filterStore.sortBy.order == SortOrder.asc
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Colors.white60,
                  ),
                ),
                Expanded(
                  child: Text(
                    context.i18n.pages.discoverMovies.orderText(
                      SortOrder.values[filterStore.sortBy.order.index],
                    ),
                    style: _getTextStyle(context, false),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TextStyle _getTextStyle(BuildContext context, bool highlighted) {
    return context.theme.textTheme.button.copyWith(
      color: highlighted ? _highlightedColor : _color,
    );
  }

  static const Color _color = Colors.white60;
  static final Color _highlightedColor = Colors.lightBlue[200];

  static final _sortValues = <int>[
    DiscoverMovieSortBy.popularity.prefix.index,
    DiscoverMovieSortBy.originalTitle.prefix.index,
    DiscoverMovieSortBy.releaseDate.prefix.index,
    DiscoverMovieSortBy.voteAverage.prefix.index,
    DiscoverMovieSortBy.voteCount.prefix.index,
    DiscoverMovieSortBy.revenue.prefix.index,
  ];
}
