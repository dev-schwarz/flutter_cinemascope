import 'package:flutter/material.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../widgets/media_tiles.dart';

mixin MediaTileMakerMixin {
  Widget makeMediaListTile(BuildContext context, ResumedMedia resumedMedia) {
    if (resumedMedia is MovieResumed) {
      return MovieListTile(resumedMedia);
    } else if (resumedMedia is TvResumed) {
      return TvListTile(resumedMedia);
    } else if (resumedMedia is PersonResumed) {
      return PersonListTile(resumedMedia);
    }

    return Container(
      height: 100.0,
      child: Text(
        'Unknown media type',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Widget makeMediaGridTile(BuildContext context, ResumedMedia resumedMedia) {
    if (resumedMedia is MovieResumed) {
      return MovieGridTile(resumedMedia);
    } else if (resumedMedia is TvResumed) {
      return TvGridTile(resumedMedia);
    } else if (resumedMedia is PersonResumed) {
      return PersonGridTile(resumedMedia);
    }

    return Container(
      height: 100.0,
      child: Text(
        'Unknown media type',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
