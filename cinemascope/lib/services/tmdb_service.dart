import 'package:tmdb_repository/tmdb_repository.dart';

class TmdbService {
  TmdbService.init(TmdbRepository api)
      : assert(api != null, 'api must not be null'),
        _api = api {
    _service = this;
  }

  factory TmdbService() {
    if (_service == null) {
      throw Exception('TmdbService must be initialized first.');
    }
    return _service;
  }

  static TmdbService _service;

  TmdbRepository get api => _api;
  final TmdbRepository _api;
}
