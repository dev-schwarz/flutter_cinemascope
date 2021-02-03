import 'package:flutter_modular/flutter_modular.dart';

import '../../global/app_routes.dart';
import '../../global/app_utils.dart';
import '../../material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _AppDrawerHeader(),
          ..._getItems(context),
        ],
      ),
    );

    // return Drawer(
    //   child: Container(
    //     child: ListView(
    //       padding: EdgeInsets.zero,
    //       children: [
    //         const _AppDrawerHeader(),
    //         ..._getItems(context),
    //       ],
    //     ),
    //   ),
    // );
  }

  List<Widget> _getItems(BuildContext context) {
    return _appDrawerItems
        .map(
          (item) => ListTile(
            title: Text(item.title),
            onTap: () {
              Modular.to.popAndPushNamed(item.routeName);
            },
          ),
        )
        .toList();
  }

  static const _appDrawerItems = const <_AppDrawerItem>[
    _AppDrawerItem(index: 0, routeName: AppRoutes.appSettings, title: 'Settings'),
    _AppDrawerItem(index: 1, routeName: AppRoutes.appAbout, title: 'About'),
  ];
}

class _AppDrawerHeader extends StatelessWidget {
  const _AppDrawerHeader();

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: context.theme.primaryColorDark,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 36.0,
            backgroundColor: context.theme.primaryColorLight,
            child: Text(
              AppUtils.getNameFirstLetters(context.userStore.user.name),
              style: context.theme.textTheme.headline6,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            context.userStore.user.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.subtitle1.copyWith(
              color: Colors.grey[200],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppDrawerItem {
  const _AppDrawerItem({
    @required this.index,
    @required this.routeName,
    @required this.title,
  });

  final int index;
  final String routeName;
  final String title;
}
