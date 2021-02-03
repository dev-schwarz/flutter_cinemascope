// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt';

  static m0(added, howMany) => "${Intl.select(added, {'true': '${Intl.plural(howMany, zero: '', one: 'Adicionado a 1 lista. ', other: 'Adicionado a ${howMany} listas. ')}', 'false': '${Intl.plural(howMany, zero: '', one: 'Removido de 1 lista. ', other: 'Removido de ${howMany} listas. ')}', })}";

  static m1(orderText) => "Mudar para ordem \"${orderText}\"";

  static m2(sortText) => "${Intl.select(sortText, {'popularity': 'Popularidade', 'original_title': 'Título', 'release_date': 'Lançamento', 'vote_average': 'Avaliação', 'vote_count': 'Mais votados', 'revenue': 'Renda', })}";

  static m3(value) => "${Intl.select(value, {'true': 'Remover dos favoritos', 'false': 'Adicionar aos favoritos', })}";

  static m4(value) => "${Intl.select(value, {'true': 'Adicionado aos favoritos', 'false': 'Removido dos favoritos', })}";

  static m5(value) => "${Intl.select(value, {'true': 'Item avaliado', 'false': 'Avaliação do item removida', })}";

  static m6(value) => "${Intl.select(value, {'true': 'Adicionado a lista para assistir', 'false': 'Removido da lista para assistir', })}";

  static m7(firstLetterUCase) => "${Intl.select(firstLetterUCase, {'true': 'Não', 'false': 'não', })}";

  static m8(order) => "${Intl.select(order, {'asc': 'Ordem ascendente', 'desc': 'Ordem descendente', })}";

  static m9(value) => "${Intl.select(value, {'true': 'Editar ou remover sua avaliação', 'false': 'Avaliar', })}";

  static m10(order, invert) => "${Intl.select(order, {'asc': '${Intl.select(invert, {'true': 'descendente', 'false': 'ascendente', })}', 'desc': '${Intl.select(invert, {'true': 'ascendente', 'false': 'descendente', })}', })}";

  static m11(value) => "${Intl.select(value, {'true': 'Remover da lista para assistir', 'false': 'Adicionar a lista para assistir', })}";

  static m12(firstLetterUCase) => "${Intl.select(firstLetterUCase, {'true': 'Sim', 'false': 'sim', })}";

  static m13(yes) => "${Intl.select(yes, {'true': 'sim', 'false': 'não', })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "_mediaListsChanged" : m0,
    "_sortOrderSwitch" : m1,
    "_sortText" : m2,
    "appTitle" : MessageLookupByLibrary.simpleMessage("Cinemascope"),
    "applyButton" : MessageLookupByLibrary.simpleMessage("Aplicar"),
    "assignments" : MessageLookupByLibrary.simpleMessage("Inscrições"),
    "closeButton" : MessageLookupByLibrary.simpleMessage("Fechar"),
    "discover" : MessageLookupByLibrary.simpleMessage("Descubra"),
    "favorite" : MessageLookupByLibrary.simpleMessage("Favoritos"),
    "favoriteTooltip" : m3,
    "library" : MessageLookupByLibrary.simpleMessage("Biblioteca"),
    "mediaFavoriteChanged" : m4,
    "mediaRateChanged" : m5,
    "mediaWatchListChanged" : m6,
    "no" : m7,
    "ofRelease" : MessageLookupByLibrary.simpleMessage("de lançamento"),
    "orderText" : m8,
    "pageTitle" : MessageLookupByLibrary.simpleMessage("Descobrir Filmes"),
    "playlist" : MessageLookupByLibrary.simpleMessage("Minhas listas"),
    "playlistTooltip" : MessageLookupByLibrary.simpleMessage("Adicionar ou remover das minhas listas"),
    "rate" : MessageLookupByLibrary.simpleMessage("Avaliar"),
    "rateTooltip" : m9,
    "settings" : MessageLookupByLibrary.simpleMessage("Configurações"),
    "settingsLanguages" : MessageLookupByLibrary.simpleMessage("Selecione um idioma"),
    "settingsRegions" : MessageLookupByLibrary.simpleMessage("Selecione uma região"),
    "setupButton" : MessageLookupByLibrary.simpleMessage("Configurar Filtros"),
    "setupTitle" : MessageLookupByLibrary.simpleMessage("Descobrir Filmes - Filtros"),
    "sortOrder" : m10,
    "trending" : MessageLookupByLibrary.simpleMessage("Em Destaque"),
    "watchList" : MessageLookupByLibrary.simpleMessage("Assistir depois"),
    "watchListTooltip" : m11,
    "year" : MessageLookupByLibrary.simpleMessage("Ano"),
    "yearOfReleaseError" : MessageLookupByLibrary.simpleMessage("Ano inválido"),
    "yearOfReleaseHint" : MessageLookupByLibrary.simpleMessage("Exemplo: 2004"),
    "yes" : m12,
    "yesNo" : m13
  };
}
