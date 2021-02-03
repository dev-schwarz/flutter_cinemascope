part of 'buttons.dart';

class MediaWatchListButton extends StatelessWidget {
  const MediaWatchListButton({
    Key key,
    @required this.mediaStore,
    this.onChanged,
  })  : assert(mediaStore != null, 'mediaStore must not be null'),
        super(key: key);

  final MediaStore mediaStore;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final onWatchList = mediaStore.hasAccountStatesData && mediaStore.accountStates.watchList;
        // final onWatchList =
        //     mediaStore.hasAccountStatesData ? mediaStore.accountStates.watchList : false;

        return _MediaButton(
          onTap:
              mediaStore.hasAccountStatesData ? () => mediaStore.setWatchList(!onWatchList) : null,
          iconData: Icons.watch_later,
          label: context.i18n.mediaButtons.watchList,
          tooltip: context.i18n.mediaButtons.watchListTooltip(onWatchList),
          iconColor: onWatchList ? Colors.indigo[300] : null,
        );
      },
    );
  }
}
