part of 'media_store.dart';

class TvSeasonStore = _TvSeasonStoreBase with _$TvSeasonStore;

abstract class _TvSeasonStoreBase extends MediaStore<TvSeason> with Store {
  _TvSeasonStoreBase({
    @required this.tv,
    @required this.seasonNumber,
  }) : super(mediaType: TMediaType.tv);

  final Tv tv;
  final int seasonNumber;

  @override
  Future<TvSeason> _fetchMediaDetails() => _tmdb.api.tvSeason
      .getDetails(
        tv.id,
        seasonNumber,
        language: TmdbConfig.language.language,
      )
      .then((value) => value);

  @override
  TmdbResumedMedia _makeResumedMedia() => TmdbResumedMedia(
        id: mediaDetails.id,
        name: mediaDetails.name,
        description: mediaDetails.overview,
        dateTime: mediaDetails.airDate,
        imageUrl: TmdbConfig.makePosterUrl(mediaDetails.posterPath),
        mediaType: mediaType,
      );
}
