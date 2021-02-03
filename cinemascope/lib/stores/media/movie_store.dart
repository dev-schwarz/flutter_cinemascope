part of 'media_store.dart';

class MovieStore = _MovieStoreBase with _$MovieStore;

abstract class _MovieStoreBase extends MediaStore<Movie> with Store {
  _MovieStoreBase({
    @required int id,
    // @required DataStore dataStore,
  })  : _id = id,
        super(mediaType: TMediaType.movie);

  final int _id;

  @override
  Future<Movie> _fetchMediaDetails() => _tmdb.api.movie
      .getDetails(
        _id,
        language: TmdbConfig.language.language,
      )
      .then((value) => value);

  @override
  Future<TAccountStates> _fetchAccountStates() => _tmdb.api.movie
      .getAccountStates(
        _id,
        language: TmdbConfig.language.language,
      )
      .then((value) => value);

  @override
  TmdbResumedMedia _makeResumedMedia() => TmdbResumedMedia(
        id: mediaDetails.id,
        name: mediaDetails.title,
        description: mediaDetails.overview,
        dateTime: mediaDetails.releaseDate,
        imageUrl: TmdbConfig.makePosterUrl(mediaDetails.posterPath),
        mediaType: mediaType,
      );
}
