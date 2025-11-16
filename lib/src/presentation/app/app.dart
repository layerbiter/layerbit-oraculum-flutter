import 'package:layerbit_oraculum_flutter/src/features/common/shared_pref/shared_pref.dart';
import 'package:layerbit_oraculum_flutter/src/presentation/common/keys.dart';
import 'package:layerbit_oraculum_flutter/src/presentation/common/router/router_config.dart';
import 'package:layerbit_oraculum_flutter/src/presentation/common/scroll_settings.dart';
import 'package:flutter/material.dart';
import 'package:layerbit_oraculum_flutter/src/presentation/common/theme/theme.dart';
import 'package:provider/provider.dart';

import 'app_vm.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppViewModel(
        context.read<MainTheme>(),
        context.read<SharedPref>(),
      ),
      builder: (context, _) {
        return const _App();
      },
    );
  }
}


class _App extends StatefulWidget {
  const _App();

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  @override
  void initState() {
    super.initState();
    context.read<AppViewModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AppViewModel>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehavior(),
      scaffoldMessengerKey: Keys.messengerKey,
      theme: vm.setTheme(context),
      routerConfig: routerConfig,
    );
  }
}
