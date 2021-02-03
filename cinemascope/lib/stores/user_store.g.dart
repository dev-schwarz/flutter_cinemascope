// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStoreBase, Store {
  Computed<bool> _$isLoggedInComputed;

  @override
  bool get isLoggedIn =>
      (_$isLoggedInComputed ??= Computed<bool>(() => super.isLoggedIn,
              name: '_UserStoreBase.isLoggedIn'))
          .value;

  final _$userAtom = Atom(name: '_UserStoreBase.user');

  @override
  TmdbUser get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(TmdbUser value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$loginFakeUserAsyncAction =
      AsyncAction('_UserStoreBase.loginFakeUser');

  @override
  Future<void> loginFakeUser() {
    return _$loginFakeUserAsyncAction.run(() => super.loginFakeUser());
  }

  final _$_UserStoreBaseActionController =
      ActionController(name: '_UserStoreBase');

  @override
  void setUser(TmdbUser user) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
