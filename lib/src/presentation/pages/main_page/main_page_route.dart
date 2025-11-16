import 'package:go_router/go_router.dart';
import 'package:layerbit_oraculum_flutter/src/presentation/pages/main_page/main_page.dart';

class MainPageRoute extends GoRoute {
  static const pageName = 'Start page';
  static const route = '/';

  MainPageRoute()
      : super(
          path: route,
          name: pageName,
          builder: (context, state) => MainPage()
        );
}
