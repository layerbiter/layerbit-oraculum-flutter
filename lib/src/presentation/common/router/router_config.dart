import 'package:layerbit_oraculum_flutter/src/presentation/pages/auth_page/auth_page_route.dart';
import 'package:layerbit_oraculum_flutter/src/presentation/pages/main_page/main_page_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    MainPageRoute(),
    AuthPageRoute(),
  ],
);
