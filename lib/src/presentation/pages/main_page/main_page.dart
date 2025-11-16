import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layerbit_oraculum_flutter/src/features/auth/domain/auth_service.dart';
import 'package:layerbit_oraculum_flutter/src/features/user_data/domain/user_data_service.dart';
import 'package:layerbit_oraculum_flutter/src/presentation/components/loading_page.dart';
import 'package:layerbit_oraculum_flutter/src/presentation/pages/auth_page/auth_page.dart';

import 'main_page_cubit.dart';
import 'main_page_state.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageCubit(
        context.read<AuthService>(),
        context.read<UserDataService>(),
      ),
      child: const _MainPage(),
    );
  }
}


class _MainPage extends StatefulWidget {
  const _MainPage({
    super.key,
  });

  @override
  State<_MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  @override
  void initState() {
    context.read<MainPageCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainPageCubit>();

    return BlocBuilder<MainPageCubit, MainPageState>(
      bloc: bloc,
      builder: (context, state) => state.isLoading && !state.isLoggedIn
          ? const LoadingPage()
          : !state.isLoggedIn
              ? const AuthPage()
              : const SizedBox()
    );
  }
}