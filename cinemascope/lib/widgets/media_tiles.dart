import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../global/app_constants.dart';
import '../global/app_routes.dart';
import '../global/helpers/tmdb_helper_mixin.dart';
import '../material.dart';
import '../models/tmdb_config_model.dart';
import '../models/tmdb_resumed_media_model.dart';

class MovieListTile extends _MediaListTileBase {
  MovieListTile(this.movieResumed, {Key key})
      : super(
          key,
          TmdbResumedMedia(
            id: movieResumed.id,
            name: movieResumed.title,
            description: movieResumed.overview,
            dateTime: movieResumed.releaseDate,
            imageUrl: TmdbConfig.makePosterUrl(movieResumed.posterPath),
            mediaType: movieResumed.mediaType,
          ),
        );

  final MovieResumed movieResumed;

  @override
  navigateToMediaDetails(BuildContext context) {
    Modular.to.pushNamed(
      AppRoutes.movieDetails,
      arguments: resumedMedia.id,
    );
  }
}

class TvListTile extends _MediaListTileBase {
  TvListTile(this.tvResumed, {Key key})
      : super(
          key,
          TmdbResumedMedia(
            id: tvResumed.id,
            name: tvResumed.name,
            description: tvResumed.overview,
            dateTime: tvResumed.firstAirDate,
            imageUrl: TmdbConfig.makePosterUrl(tvResumed.posterPath),
            mediaType: tvResumed.mediaType,
          ),
        );

  final TvResumed tvResumed;

  @override
  navigateToMediaDetails(BuildContext context) {
    Modular.to.pushNamed(
      AppRoutes.tvDetails,
      arguments: resumedMedia.id,
    );
  }
}

class PersonListTile extends _MediaListTileBase {
  PersonListTile(this.personResumed, {Key key})
      : super(
          key,
          TmdbResumedMedia(
            id: personResumed.id,
            name: personResumed.name,
            description: personResumed.gender.toString(),
            imageUrl: TmdbConfig.makeProfileUrl(personResumed.profilePath),
            mediaType: personResumed.mediaType,
          ),
        );

  final PersonResumed personResumed;

  @override
  navigateToMediaDetails(BuildContext context) {
    Modular.to.pushNamed(
      AppRoutes.personDetails,
      arguments: resumedMedia.id,
    );
  }
}

class MovieGridTile extends _MediaGridTileBase {
  MovieGridTile(
    this.movieResumed, {
    Key key,
  }) : super(
          key,
          TmdbResumedMedia(
            id: movieResumed.id,
            name: movieResumed.title,
            description: movieResumed.overview,
            dateTime: movieResumed.releaseDate,
            imageUrl: TmdbConfig.makePosterUrl(movieResumed.posterPath),
            mediaType: movieResumed.mediaType,
          ),
        );

  final MovieResumed movieResumed;

  @override
  navigateToMediaDetails(BuildContext context) {
    Modular.to.pushNamed(
      AppRoutes.movieDetails,
      arguments: resumedMedia.id,
    );
  }
}

class TvGridTile extends _MediaGridTileBase {
  TvGridTile(
    this.tvResumed, {
    Key key,
  }) : super(
          key,
          TmdbResumedMedia(
            id: tvResumed.id,
            name: tvResumed.name,
            description: tvResumed.overview,
            dateTime: tvResumed.firstAirDate,
            imageUrl: TmdbConfig.makePosterUrl(tvResumed.posterPath),
            mediaType: tvResumed.mediaType,
          ),
        );

  final TvResumed tvResumed;

  @override
  navigateToMediaDetails(BuildContext context) {
    Modular.to.pushNamed(
      AppRoutes.tvDetails,
      arguments: resumedMedia.id,
    );
  }
}

class PersonGridTile extends _MediaGridTileBase {
  PersonGridTile(
    this.personResumed, {
    Key key,
  }) : super(
          key,
          TmdbResumedMedia(
            id: personResumed.id,
            name: personResumed.name,
            description: personResumed.gender.toString(),
            imageUrl: TmdbConfig.makeProfileUrl(personResumed.profilePath),
            mediaType: personResumed.mediaType,
          ),
        );

  final PersonResumed personResumed;

  @override
  navigateToMediaDetails(BuildContext context) {
    Modular.to.pushNamed(
      AppRoutes.personDetails,
      arguments: resumedMedia.id,
    );
  }
}

abstract class _MediaTileBase extends StatelessWidget with TmdbHelperMixin {
  const _MediaTileBase(
    Key key,
    this.resumedMedia,
  )   : assert(resumedMedia != null, 'resumedMedia must not be null'),
        super(key: key);

  final TmdbResumedMedia resumedMedia;

  void showMediaInfoBar(BuildContext context) {
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(getMediaTypeIcon(resumedMedia.mediaType)),
              const SizedBox(width: 10.0),
              Text(
                resumedMedia.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
          duration: const Duration(milliseconds: 1500),
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          backgroundColor: Theme.of(context).accentColor,
        ),
      );
  }

  navigateToMediaDetails(BuildContext context);
}

abstract class _MediaListTileBase extends _MediaTileBase {
  const _MediaListTileBase(
    Key key,
    TmdbResumedMedia resumedMedia,
  ) : super(key, resumedMedia);

  @override
  Widget build(BuildContext context) {
    final mediaTypeIcon = getMediaTypeIcon(resumedMedia.mediaType);

    final bottomRow = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          resumedMedia?.dateTime?.year?.toString() ?? '',
          style: context.appTheme.mediaTileTheme.bottomTextStyle,
        ),
        const SizedBox(width: 16.0),
      ],
    );

    final leftColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // [[ title ]]
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              mediaTypeIcon,
              size: 18.0,
              color: context.appTheme.mediaTileTheme.mediaIconColor,
            ),
            const SizedBox(width: 6.0),
            Expanded(
              child: Text(
                resumedMedia.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.appTheme.mediaTileTheme.titleTextStyle,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: IndentedText(
            resumedMedia.description,
            textAlign: TextAlign.justify,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: context.appTheme.mediaTileTheme.descriptionTextStyle,
          ),
        ),
        bottomRow,
        const SizedBox(height: 6.0),
      ],
    );

    final poster = AspectRatio(
      aspectRatio: AppConstants.kAppTmdbPosterAspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: context.appTheme.mediaTileTheme.posterBackgroundColor,
          image: resumedMedia.imageUrl != null
              ? DecorationImage(
                  image: NetworkImage(resumedMedia.imageUrl),
                  fit: BoxFit.fill,
                )
              : null,
        ),
        child: resumedMedia.imageUrl != null
            ? null
            : Icon(
                mediaTypeIcon,
                size: AppConstants.kAppAlternativeMediaIconSize,
              ),
      ),
    );

    return Card(
      margin: const EdgeInsets.fromLTRB(10.0, 6.0, 4.0, 6.0),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        onTap: () => navigateToMediaDetails(context),
        child: Row(
          children: [
            Expanded(child: leftColumn),
            const SizedBox(width: 18.0),
            poster,
          ],
        ),
      ),
    );

    // return Container(
    //   child: Card(
    //     margin: const EdgeInsets.fromLTRB(10.0, 6.0, 4.0, 6.0),
    //     color: Theme.of(context).scaffoldBackgroundColor,
    //     child: InkWell(
    //       onTap: () => navigateToMediaDetails(context),
    //       child: Row(
    //         children: [
    //           Expanded(child: leftColumn),
    //           const SizedBox(width: 18.0),
    //           poster,
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

abstract class _MediaGridTileBase extends _MediaTileBase {
  const _MediaGridTileBase(
    Key key,
    TmdbResumedMedia resumedMedia,
  ) : super(key, resumedMedia);

  @override
  Widget build(BuildContext context) {
    final bool hasImageUrl = resumedMedia.imageUrl != null;

    final inkWellWidget = InkWell(
      onTap: () => navigateToMediaDetails(context),
      onLongPress: () => super.showMediaInfoBar(context),
      child: hasImageUrl
          ? null
          : Icon(
              getMediaTypeIcon(resumedMedia.mediaType),
              size: AppConstants.kAppAlternativeMediaIconSize,
            ),
    );

    final inkWidget = hasImageUrl
        ? Ink.image(
            image: NetworkImage(resumedMedia.imageUrl),
            alignment: Alignment.center,
            fit: BoxFit.fill,
            child: inkWellWidget,
          )
        : Ink(
            child: InkWell(
              onTap: navigateToMediaDetails(context),
              onLongPress: () => super.showMediaInfoBar(context),
              child: inkWellWidget,
            ),
          );

    return Material(
      color: Colors.grey,
      child: inkWidget,
    );
  }
}
