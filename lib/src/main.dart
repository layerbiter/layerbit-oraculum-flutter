import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:layerbit_oraculum_flutter/src/di/providers.dart';
import 'package:layerbit_oraculum_flutter/src/presentation/app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(
    const DependenciesProvider(
      app: App(),
    ),
  );
}
