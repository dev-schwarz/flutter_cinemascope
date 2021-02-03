import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../global/app_routes.dart';
import '../material.dart';
import '../pages/drawer_pages/about/about_page.dart';
import '../pages/drawer_pages/settings/settings_page.dart';
import '../pages/home/home_page.dart';
import '../pages/initial/initial_page.dart';
import '../pages/library/pages/favorite_movies_page.dart';
import '../pages/library/pages/favorite_tvs_page.dart';
import '../pages/library/pages/user_list_page.dart';
import '../pages/library/pages/watch_list_movies_page.dart';
import '../pages/library/pages/watch_list_tvs_page.dart';
import '../pages/media/pages/movie_page.dart';
import '../pages/media/pages/person_page.dart';
import '../pages/media/pages/tv_episode_page.dart';
import '../pages/media/pages/tv_page.dart';
import '../pages/media/pages/tv_season_page.dart';
import '../pages/search/search_page.dart';
import '../services/prefs_service.dart';
import '../services/tmdb_service.dart';
import '../stores/data/data_store.dart';
import '../stores/media/media_store.dart';
import '../stores/pages_controllers/home_controller.dart';
import '../stores/settings_store.dart';
import '../stores/user_store.dart';
import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TmdbService.init(_ApiInitializer._initApi())),
        Bind((i) => PrefsService()),
        Bind((i) => SettingsStore(), lazy: false),
        Bind((i) => UserStore()),
        Bind((i) => DataStore()),
        Bind((i) => HomeController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(AppRoutes.initial, child: (_, __) => const InitialPage()),
        ModularRouter(AppRoutes.home, child: (_, __) => const HomePage()),
        ModularRouter(AppRoutes.search, child: (_, __) => const SearchPage()),
        ModularRouter(AppRoutes.appAbout, child: (_, __) => const AboutPage()),
        ModularRouter(AppRoutes.appSettings, child: (_, __) => const SettingsPage()),
        ModularRouter(AppRoutes.libraryFavoriteMovies,
            child: (_, __) => const FavoriteMoviesPage()),
        ModularRouter(AppRoutes.libraryFavoriteTvs, child: (_, __) => const FavoriteTvsPage()),
        ModularRouter(AppRoutes.libraryWatchListMovies,
            child: (_, __) => const WatchListMoviesPage()),
        ModularRouter(AppRoutes.libraryWatchListTvs, child: (_, __) => const WatchListTvsPage()),
        ModularRouter(
          AppRoutes.libraryUserList,
          child: (_, args) => UserListPage(args.data),
        ),
        ModularRouter(
          AppRoutes.movieDetails,
          child: (_, args) => MoviePage(MovieStore(id: args.data)),
        ),
        ModularRouter(
          AppRoutes.personDetails,
          child: (_, args) => PersonPage(PersonStore(id: args.data)),
        ),
        ModularRouter(
          AppRoutes.tvDetails,
          child: (_, args) => TvPage(TvStore(id: args.data)),
        ),
        ModularRouter(
          AppRoutes.tvSeasonDetails,
          child: (_, args) => TvSeasonPage(TvSeasonStore(
            tv: args.data['tv'],
            seasonNumber: args.data['season_number'],
          )),
        ),
        ModularRouter(
          AppRoutes.tvEpisodeDetails,
          child: (_, args) => TvEpisodePage(TvEpisodeStore(
            tv: args.data['tv'],
            tvSeason: args.data['tv_season'],
            episodeNumber: args.data['episode_number'],
          )),
        ),
      ];

  @override
  Widget get bootstrap => const AppWidget();
}

class _ApiInitializer {
  const _ApiInitializer._();

  // static void initTmdbService() {
  //   TmdbService.init(_initApi());
  // }

  static TmdbRepository _initApi() {
    return TmdbRepository(
      r'''ffea4ca1099c6f945cfe912e08056be2''',
      r'''eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZmVhNGNhMTA5OWM2Zjk0NWNmZTkxMmUwODA1NmJlMiIsInN1YiI6IjVkM2ZhNWU5MzRlMTUyMWZiOGU3OWQ1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qLAhUehikWiZ8Oj8bHNZN5PSL2irXz-5mtcok9_NBtg''',
    );
  }
}
