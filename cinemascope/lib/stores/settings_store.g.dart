// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStoreBase, Store {
  final _$stateAtom = Atom(name: '_SettingsStoreBase.state');

  @override
  SettingsState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(SettingsState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$saveSettingsAsyncAction =
      AsyncAction('_SettingsStoreBase.saveSettings');

  @override
  Future<void> saveSettings() {
    return _$saveSettingsAsyncAction.run(() => super.saveSettings());
  }

  final _$_SettingsStoreBaseActionController =
      ActionController(name: '_SettingsStoreBase');

  @override
  void loadSettings() {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.loadSettings');
    try {
      return super.loadSettings();
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
