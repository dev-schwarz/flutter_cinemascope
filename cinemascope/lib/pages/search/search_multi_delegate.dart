import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../global/app_constants.dart';
import '../../global/helpers/tmdb_helper_mixin.dart';
import '../../material.dart';
import '../../stores/search_store.dart';

class SearchMultiDelegate extends SearchDelegate<String> with TmdbHelperMixin {
  SearchMultiDelegate(this.store) : super();

  final SearchSuggestionsStore store;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          tooltip: 'Clear',
          onPressed: () {
            query = '';
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero).whenComplete(() {
      close(context, query.isEmpty ? null : query);
    });
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    store.fetchSuggestions(query);

    return Observer(
      builder: (_) {
        if (!store.hasSuggestions) {
          return const BigLoadingIndicator(
            iconData: Icons.search,
            title: 'Searching',
          );
        }

        return ListView.builder(
          padding: AppConstants.kAppListViewPadding,
          itemCount: store.suggestions.results.length,
          itemBuilder: (ctx, index) {
            return _makeListTile(context, store.suggestions.results[index]);
          },
        );
      },
    );
  }

  Widget _makeListTile(BuildContext context, ResumedMedia resumedMedia) {
    String title;
    if (resumedMedia is MovieResumed) {
      title = resumedMedia.title;
    } else if (resumedMedia is TvResumed) {
      title = resumedMedia.name;
    } else if (resumedMedia is PersonResumed) {
      title = resumedMedia.name;
    }

    return ListTile(
      title: Text(title ?? 'Unknown media type'),
      leading: Icon(title != null ? getMediaTypeIcon(resumedMedia.mediaType) : Icons.play_arrow),
      onTap: () {
        close(context, title);
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) => context.theme.brightness == Brightness.light
      ? _getThemeLight(context)
      : _getThemeDark(context);

  static ThemeData _getThemeLight(BuildContext context) {
    return context.theme.copyWith(
      primaryColorBrightness: Brightness.light,
      primaryColor: Colors.white,
      primaryIconTheme: context.theme.iconTheme.copyWith(color: Colors.grey[400]),
      textTheme: context.theme.textTheme.apply(
        bodyColor: Colors.black,
        decorationColor: Colors.black,
      ),
      inputDecorationTheme: context.theme.inputDecorationTheme.copyWith(
        hintStyle: context.theme.textTheme.headline6.copyWith(color: Colors.grey[400]),
      ),
    );
  }

  static ThemeData _getThemeDark(BuildContext context) {
    return context.theme.copyWith(
      primaryColorBrightness: Brightness.dark,
      primaryColor: Colors.black,
      primaryIconTheme: context.theme.iconTheme.copyWith(color: Colors.grey[400]),
      textTheme: context.theme.textTheme.apply(
        bodyColor: Colors.blue,
        decorationColor: Colors.blueAccent,
      ),
      inputDecorationTheme: context.theme.inputDecorationTheme.copyWith(
        hintStyle: context.theme.textTheme.headline6.copyWith(color: Colors.grey[600]),
      ),
    );
  }
}
