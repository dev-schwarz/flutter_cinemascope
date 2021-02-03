import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../material.dart';
import '../../stores/pages_controllers/home_controller.dart';
import '../../stores/results/results_store.dart';
import '../discover/discover_movies_page.dart';
import '../library/library_page.dart';
import '../trending/trending_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  List<_BottomNavBarItemData> _pagesData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _pagesData = [
      _BottomNavBarItemData(
        icon: Icons.trending_up,
        label: context.i18n.pages.trending,
        child: TrendingPage(TrendingStore()),
      ),
      _BottomNavBarItemData(
        icon: Icons.new_releases,
        label: context.i18n.pages.discover,
        child: const DiscoverMoviesPage(),
      ),
      _BottomNavBarItemData(
        icon: Icons.assignment,
        label: context.i18n.pages.assignments,
        child: _TempScreen(context.i18n.pages.assignments),
      ),
      _BottomNavBarItemData(
        icon: Icons.video_library,
        label: context.i18n.pages.library,
        child: const LibraryPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          primary: false,
          body: _body,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            backgroundColor: context.theme.canvasColor,
            unselectedItemColor: context.theme.unselectedWidgetColor,
            selectedItemColor: context.theme.accentColor,
            currentIndex: this.controller.currentPageIndex,
            onTap: this.controller.changePage,
            items: _bottomNavigationBarItems,
          ),
        );
      },
    );
  }

  Widget get _body {
    return _pagesData[this.controller.currentPageIndex].child;
  }

  List<BottomNavigationBarItem> get _bottomNavigationBarItems {
    return _pagesData
        .map<BottomNavigationBarItem>((data) => BottomNavigationBarItem(
              icon: Icon(data.icon),
              label: data.label,
            ))
        .toList();
  }
}

class _BottomNavBarItemData {
  const _BottomNavBarItemData({
    @required this.icon,
    @required this.label,
    @required this.child,
  });

  final IconData icon;
  final String label;
  final Widget child;
}

class _TempScreen extends StatelessWidget {
  const _TempScreen(this.title, {Key key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppDrawerLeadingButton(),
        title: Text(title),
        actions: const [
          const AppBarSearchButton(),
        ],
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          title,
          style: context.theme.textTheme.headline6,
        ),
      ),
    );
  }
}
