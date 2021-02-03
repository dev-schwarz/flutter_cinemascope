part of 'media_store.dart';

class TvEpisodeStore = _TvEpisodeStoreBase with _$TvEpisodeStore;

abstract class _TvEpisodeStoreBase extends MediaStore<TvEpisode> with Store {
  _TvEpisodeStoreBase({
    @required this.tv,
    @required this.tvSeason,
    @required this.episodeNumber,
  }) : super(mediaType: TMediaType.tv);

  final Tv tv;
  final TvSeason tvSeason;
  final int episodeNumber;

  @override
  Future<TvEpisode> _fetchMediaDetails() => _tmdb.api.tvEpisode
      .getDetails(
        tv.id,
        tvSeason.seasonNumber,
        episodeNumber,
        language: TmdbConfig.language.language,
      )
      .then((value) => value);

  @override
  TmdbResumedMedia _makeResumedMedia() => TmdbResumedMedia(
        id: mediaDetails.id,
        name: mediaDetails.name,
        description: mediaDetails.overview,
        dateTime: mediaDetails.airDate,
        imageUrl: TmdbConfig.makeStillUrl(mediaDetails.stillPath),
        mediaType: mediaType,
      );
}
