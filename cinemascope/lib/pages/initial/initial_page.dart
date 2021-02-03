import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../global/app_routes.dart';
import '../../material.dart';

part 'logo.dart';
part 'splash.dart';

class _InitialWidgetsConstants {
  const _InitialWidgetsConstants._();

  static const secondaryColor = const Color(0xff01b4e4);
  static const tertiaryColor = const Color(0xff90cea1);

  static const secondaryOpacity = 0.5;
}

class InitialPage extends StatelessWidget {
  const InitialPage();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (context.userStore.isLoggedIn) {
          return const _Splash();
        } else {
          return _Logo(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RaisedButton(
                      onPressed: context.userStore.loginFakeUser,
                      child: const Text('Temporary Fake Login on TMDb'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Modular.to.pushReplacementNamed(AppRoutes.login);
                      },
                      elevation: 10.0,
                      child: const Text('Login on TMDb'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
