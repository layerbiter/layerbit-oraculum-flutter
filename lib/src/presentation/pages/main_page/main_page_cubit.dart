import 'dart:async';

import 'package:layerbit_oraculum_flutter/src/features/auth/domain/auth_service.dart';
import 'package:layerbit_oraculum_flutter/src/features/user_data/domain/user_data_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  final AuthService _authService;
  final UserDataService _userDataService;

  MainPageCubit(
    this._authService,
    this._userDataService,
  ) : super(const MainPageState());

  late StreamSubscription? _streamSubscription;

  Future<void> init() async {
    await _subscribeAuthStream();
  }

  Future<void> _subscribeAuthStream() async {
    _streamSubscription = _authService.authState.listen((authState) async {
      final isLoggedIn = _authService.userLoggedIn();

      if (isLoggedIn) {
        await _userDataService.initUserData();
      }


    });
    emit(const MainPageState(isLoggedIn: false, isLoading: false));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
