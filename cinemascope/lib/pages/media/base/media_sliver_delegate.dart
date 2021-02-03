import 'package:flutter_modular/flutter_modular.dart';

import '../../../global/app_routes.dart';
import '../../../global/helpers/tmdb_helper_mixin.dart';
import '../../../material.dart';
import '../../../models/tmdb_resumed_media_model.dart';

class MediaSliverDelegate extends SliverPersistentHeaderDelegate with TmdbHelperMixin {
  MediaSliverDelegate({
    @required this.resumedMedia,
    @required this.title,
    this.subtitle,
    this.contents,
  });

  final TmdbResumedMedia resumedMedia;
  final String title;
  final String subtitle;
  final List<Widget> contents;

  Color _backgroundColor;
  double _screenWidth;
  BoxConstraints _constraints;
  IconData _mediaIconData;
  double _mediaIconCardLeft;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    _screenWidth ??= MediaQuery.of(context).size.width;
    _backgroundColor = Colors.black.withOpacity(_backgroundOpacity(shrinkOffset));
    _mediaIconCardLeft ??= (_screenWidth / 2) - _mediaIconCardHalfSize;
    _mediaIconData ??= getMediaTypeIcon(resumedMedia.mediaType);

    final opacity =
        _clampDouble(1.0 - (shrinkOffset / (_expandedHeight - minExtent - _opacityFactor)));

    return LayoutBuilder(
      builder: (ctx, constraints) {
        _constraints = constraints;

        return Container(
          color: _backgroundColor,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              // [[ poster ]]
              Positioned(
                top: 0.0,
                left: 0.0,
                bottom: 0.0,
                child: _poster(context, shrinkOffset),
              ),
              // [[ texts ]]
              Positioned(
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: _texts(context, shrinkOffset, opacity),
              ),
              // [[ navigation buttons ]]
              _navigationButtons(context),
              // [[ floating media icon card ]]
              _mediaIconCard(context, shrinkOffset, opacity),
            ],
          ),
        );
      },
    );
  }

  Widget _navigationButtons(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: Row(
        children: [
          CircularIconButton(
            BackButton(
              color: context.appTheme.mediaDetailsTheme.appBarBackButtonColor,
            ),
            onTap: () {
              if (Modular.to.canPop()) {
                Modular.to.pop();
              }
            },
            size: const CircularIconButtonSize(
              sizeType: CircularIconButtonSizeType.toolbar,
            ),
            opacity: 0.15,
            backgroundColor: context.appTheme.mediaDetailsTheme.appBarBackButtonBackgroundColor,
          ),
          CircularIconButton(
            const Icon(Icons.close),
            onTap: () {
              Modular.to.popUntil((route) => route.settings.name == AppRoutes.home);
            },
          ),
        ],
      ),
    );
  }

  Widget _poster(BuildContext context, double shrinkOffset) {
    final posterWidget = resumedMedia.imageUrl != null
        // [[ media poster ]]
        ? Opacity(
            opacity: _clampDouble(1.0 - (shrinkOffset / ((_expandedHeight * 2) - minExtent))),
            // child: Image.network(
            //   resumedMedia.imageUrl,
            //   height: _constraints.biggest.height,
            //   fit: BoxFit.cover,
            // ),
            child: AspectRatio(
              aspectRatio: _imageAspectRatio,
              child: Image.network(
                resumedMedia.imageUrl,
                height: _constraints.biggest.height,
                fit: BoxFit.cover,
              ),
            ),
          )
        // [[ media icon ]]
        : Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: _MediaIconCard(
                _mediaIconData,
                size: _constraints.smallest.height / 2.5,
                elevation: 4.0,
                opacity: _clampDouble(1.0 - (shrinkOffset / (_expandedHeight - (minExtent * 2)))),
                backgroundColor: Colors.grey.withAlpha(90),
              ),
            ),
          );

    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor,
        boxShadow: const <BoxShadow>[
          const BoxShadow(
            offset: const Offset(0.0, 1.5),
            color: const Color(0xff212121),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: posterWidget,
    );
  }

  Widget _texts(BuildContext context, double shrinkOffset, double opacity) {
    final height = _constraints.biggest.height;
    final posterWidth = _imageAspectRatio * height;
    final width = _constraints.biggest.width - posterWidth;
    final showOnlyTitle = shrinkOffset > (maxExtent - minExtent);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!showOnlyTitle) const Spacer(flex: 7),
          // [[ title ]]
          Flexible(
            flex: 8,
            fit: showOnlyTitle ? FlexFit.loose : FlexFit.tight,
            child: Text(
              title,
              maxLines: (showOnlyTitle && subtitle != null) ? 1 : 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: context.appTheme.mediaDetailsTheme.appBarTextStyle1.copyWith(
                // fontFamily: 'Rubik',
                fontSize: 18.0,
              ),
            ),
          ),
          // [[ subtitle ]]
          if (subtitle != null)
            Flexible(
              flex: 6,
              fit: showOnlyTitle ? FlexFit.loose : FlexFit.tight,
              child: Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: context.appTheme.mediaDetailsTheme.appBarTextStyle2.copyWith(
                    // fontFamily: 'Rubik',
                    ),
              ),
            ),
          // [[ contents ]]
          if (!showOnlyTitle && contents != null)
            ...contents.map((child) {
              return Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Opacity(
                  opacity: opacity,
                  child: child,
                ),
              );
            }).toList(),
          if (!showOnlyTitle) const Spacer(flex: 4),
        ],
      ),
    );
  }

  Widget _mediaIconCard(BuildContext context, double shrinkOffset, double opacity) {
    final mediaIconCardTop = _expandedHeight - _mediaIconCardHalfSize - shrinkOffset;

    return Positioned(
      top: mediaIconCardTop,
      left: _mediaIconCardLeft,
      child: _MediaIconCard(
        _mediaIconData,
        opacity: opacity,
      ),
    );
  }

  double _backgroundOpacity(double shrinkOffset) =>
      _clampDouble(shrinkOffset / (_expandedHeight + (minExtent * 2) - _opacityFactor))
          .clamp(0.3, 1.0);

  @override
  double get maxExtent => _expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

  static double _clampDouble(double value) => value.clamp(0.0, 1.0);

  static const _expandedHeight = 200.0;
  static const _mediaIconCardSize = 50.0;
  static const _mediaIconCardHalfSize = _mediaIconCardSize / 2;
  static const _opacityFactor = _mediaIconCardSize / 2;
  static const _defaultIconSize = 24.0;
  static const _iconSizeFactor = _defaultIconSize / _mediaIconCardSize;
  static const _imageAspectRatio = 0.6667;
}

class _MediaIconCard extends StatelessWidget {
  const _MediaIconCard(
    this.iconData, {
    Key key,
    this.opacity = 1.0,
    this.size = MediaSliverDelegate._mediaIconCardSize,
    this.elevation = 10.0,
    this.backgroundColor,
  })  : assert(iconData != null, 'iconData must not be null'),
        assert(opacity != null && opacity >= 0.0 && opacity <= 1.0,
            'opacity must be between or equals to 0.0 and 1.0'),
        super(key: key);

  final IconData iconData;
  final double opacity;
  final double size;
  final double elevation;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final iconSize = size * MediaSliverDelegate._iconSizeFactor;

    return Opacity(
      opacity: opacity,
      child: Card(
        margin: const EdgeInsets.all(0.0),
        color: context.appTheme.mediaDetailsTheme.headerMediaIconCardBackgroundColor,
        elevation: 10.0,
        child: SizedBox(
          height: MediaSliverDelegate._mediaIconCardSize,
          width: MediaSliverDelegate._mediaIconCardSize,
          child: Icon(
            iconData,
            size: iconSize,
            color: context.appTheme.mediaDetailsTheme.headerMediaIconCardColor,
          ),
        ),
      ),
    );
  }
}
