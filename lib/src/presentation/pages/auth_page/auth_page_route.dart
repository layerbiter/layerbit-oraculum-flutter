import 'package:go_router/go_router.dart';
import 'package:layerbit_oraculum_flutter/src/presentation/pages/auth_page/auth_page.dart';

class AuthPageRoute extends GoRoute {
  static const pageName = 'Auth page';
  static const route = '/auth';

  AuthPageRoute() : super(
    path: route,
    name: pageName,
    builder: (context, state) => const AuthPage()
  );
}
