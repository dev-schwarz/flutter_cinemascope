import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../models/tmdb_user_model.dart';
import '../services/tmdb_service.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final TmdbService _tmdb = Modular.get<TmdbService>();

  @observable
  TmdbUser user;

  @computed
  bool get isLoggedIn => user?.isLoggedIn ?? false;

  @action
  void setUser(TmdbUser user) => this.user = user;

  @action
  Future<void> loginFakeUser() async {
    final TmdbUserCredentials credentials = TmdbUserCredentials(
      sessionId: _LoginConstants.fakeSessionId,
      accountId: _LoginConstants.fakeAccountId,
      accessToken: _LoginConstants.fakeAccessToken,
    );

    _tmdb.api.loginAll(
      credentials.sessionId,
      credentials.accountId,
      credentials.accessToken,
    );

    final AccountDetails accountDetails = await _tmdb.api.account.getDetails();
    setUser(_mapAccountDetailsToUser(accountDetails, credentials));
  }

  TmdbUser _mapAccountDetailsToUser(
      AccountDetails accountDetails, TmdbUserCredentials credentials) {
    return TmdbUser(
      id: accountDetails.id,
      name: accountDetails.name,
      username: accountDetails.username,
      credentials: credentials,
    );
  }
}

class _LoginConstants {
  const _LoginConstants._();

  static const redirectToV4 = r'''http://__authorized_v4__.tmdb''';

  static const requestTokenPart = '{{REQUEST_TOKEN}}';

  static const authBaseUrlV4 = 'https://www.themoviedb.org'
      '/auth/access'
      '?request_token=$requestTokenPart';

  static const fakeSessionId = r'''e1bd92f910495860302e00f4a97668a233ab8b66''';
  static const fakeAccountId = r'''5eb4bb017ac8290022228128''';
  static const fakeAccessToken =
      r'''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2MDQ2MzI0NDksInN1YiI6IjVlYjRiYjAxN2FjODI5MDAyMjIyODEyOCIsImp0aSI6IjI1MzI1NzgiLCJhdWQiOiJmZmVhNGNhMTA5OWM2Zjk0NWNmZTkxMmUwODA1NmJlMiIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.nLFgA3mCMoUHFy4xbE5F3CJTpLfzUvjPlDye9eae0io''';
}
