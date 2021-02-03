part of 'media_store.dart';

class TvStore = _TvStoreBase with _$TvStore;

abstract class _TvStoreBase extends MediaStore<Tv> with Store {
  _TvStoreBase({
    @required int id,
  })  : _id = id,
        super(mediaType: TMediaType.tv);

  final int _id;

  @override
  Future<Tv> _fetchMediaDetails() => _tmdb.api.tv
      .getDetails(
        _id,
        language: TmdbConfig.language.language,
      )
      .then((value) => value);

  @override
  Future<TAccountStates> _fetchAccountStates() => _tmdb.api.tv
      .getAccountStates(
        _id,
        language: TmdbConfig.language.language,
      )
      .then((value) => value);

  @override
  TmdbResumedMedia _makeResumedMedia() => TmdbResumedMedia(
        id: mediaDetails.id,
        name: mediaDetails.name,
        description: mediaDetails.overview,
        dateTime: mediaDetails.firstAirDate,
        imageUrl: TmdbConfig.makePosterUrl(mediaDetails.posterPath),
        mediaType: mediaType,
      );
}
