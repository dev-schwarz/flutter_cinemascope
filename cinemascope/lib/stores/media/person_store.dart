part of 'media_store.dart';

class PersonStore = _PersonStoreBase with _$PersonStore;

abstract class _PersonStoreBase extends MediaStore<Person> with Store {
  _PersonStoreBase({
    @required int id,
    // @required DataStore dataStore,
  })  : _id = id,
        super(mediaType: TMediaType.person);

  final int _id;

  @override
  Future<Person> _fetchMediaDetails() => _tmdb.api.people
      .getDetails(
        _id,
        language: TmdbConfig.language.language,
      )
      .then((value) => value);

  @override
  TmdbResumedMedia _makeResumedMedia() => TmdbResumedMedia(
        id: mediaDetails.id,
        name: mediaDetails.name,
        description: mediaDetails.gender.toString(),
        dateTime: mediaDetails.birthday,
        imageUrl: TmdbConfig.makeProfileUrl(mediaDetails.profilePath),
        mediaType: mediaType,
      );
}
