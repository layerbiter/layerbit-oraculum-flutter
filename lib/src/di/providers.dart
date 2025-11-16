import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layerbit_oraculum_flutter/src/features/auth/data/auth_api.dart';
import 'package:layerbit_oraculum_flutter/src/features/auth/data/auth_repository.dart';
import 'package:layerbit_oraculum_flutter/src/features/auth/domain/auth_service.dart';
import 'package:layerbit_oraculum_flutter/src/features/common/api/api_client.dart';
import 'package:layerbit_oraculum_flutter/src/features/common/shared_pref/shared_pref.dart';
import 'package:layerbit_oraculum_flutter/src/features/user_data/data/user_data_api.dart';
import 'package:layerbit_oraculum_flutter/src/features/user_data/data/user_data_repository.dart';
import 'package:layerbit_oraculum_flutter/src/features/user_data/data/user_data_storage.dart';
import 'package:layerbit_oraculum_flutter/src/features/user_data/domain/user_data_service.dart';
import 'package:layerbit_oraculum_flutter/src/presentation/common/theme/theme.dart';
import 'package:provider/single_child_widget.dart';

class DependenciesProvider extends StatelessWidget {
  final Widget app;

  const DependenciesProvider({
    super.key,
    required this.app,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: <SingleChildWidget>[
        RepositoryProvider<MainTheme>(
          create: (context) => const MainTheme(),
        ),
        RepositoryProvider<SharedPref>(
          create: (context) => SharedPref(),
        ),
        RepositoryProvider<ApiClient>(
          create: (context) => ApiClient(),
        ),
        RepositoryProvider<UserDataService>(
          create: (context) => UserDataService(
            UserDataRepository(
              UserDataApi(context.read<ApiClient>().dio),
              UserDataStorage(context.read<SharedPref>()),
            ),
          ),
        ),
        RepositoryProvider<AuthService>(
          create: (context) => AuthService(
            AuthRepository(
              AuthApi(context.read<ApiClient>().dio),
            ),
            context.read<UserDataService>(),
          ),
        ),
      ],
      child: app,
    );
  }
}
