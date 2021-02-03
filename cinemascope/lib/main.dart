import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'services/prefs_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PrefsService.init().whenComplete(() {
    runApp(ModularApp(module: AppModule()));
  });
  // runApp(MyApp());
}
