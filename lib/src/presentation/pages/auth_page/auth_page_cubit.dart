import 'dart:async';

import 'package:layerbit_oraculum_flutter/src/features/auth/domain/auth_service.dart';
import 'package:layerbit_oraculum_flutter/src/presentation/common/error_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'auth_page_state.dart';

class AuthPageCubit extends Cubit<AuthPageState> with ErrorHandler {
  final AuthService _authService;

  AuthPageCubit(
    this._authService,
  ) : super(AuthPageState());

  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();

  late StreamSubscription? _streamSubscription;

  Future<void> init() async {
    _streamSubscription = _authService.registrationState.listen((value) {
      if (value.isNotEmpty) {
        emit(AuthPageState(
          authModel: state.authModel,
          isLoading: state.isLoading,
          registrationMessage: value,
        ));
      }
    });
  }

  Future<void> goToRecoveryPassPage(BuildContext context) async {}

  bool isShowBtn() {
    final isLogin = loginController.text.length >= 3;
    final isPass = passController.value.text.length >= 3;

    return isLogin && isPass;
  }

  Future<void> login() async {
    final email = loginController.text;
    final password = passController.text;

    if (isShowBtn()) {
      emit(state.copyWith(isLogin: true));

      try {
        final authModel = await _authService.signIn(
          email,
          password,
        );

        emit(state.copyWith(
          authModel: authModel,
          isLoading: false,
        ));
      } on Exception catch (e) {
        handleError(
          e,
        );
        emit(state.copyWith(isLoading: false));
      }
    }
  }

  Future<void> registration() async {
    final email = loginController.text;
    final password = passController.text;

    if (isShowBtn()) {
      emit(state.copyWith(isLoading: true));
      try {
        final authModel = await _authService.registration(
          email,
          password,
        );

        if (state.registrationMessage.isNotEmpty) {
          Future.delayed(Duration(seconds: 2)).then(
            (value) => {
              emit(state.copyWith(
                authModel: authModel,
                isLoading: false,
                registrationMessage: '',
              )),
            },
          );
        }
      } on Exception catch (e) {
        handleError(
          e,
        );
        emit(state.copyWith(isLoading: false));
      }
    }
  }

  void showPass() {
    emit(state.copyWith(isShowPass: !state.isShowPass));
  }

  void validateEmail(String value) {
    final isLogin = value.length >= 3;

    emit(
      state.copyWith(
        isLogin: isLogin,
        isPass: state.isPass,
      ),
    );
  }

  void validatePass(String value) {
    final isPass = value.length >= 3;

    emit(
      state.copyWith(
        isLogin: state.isLogin,
        isPass: isPass,
      ),
    );
  }

  void setRegistrationView(bool value) {
    loginController.clear();
    passController.clear();
    emit(
      state.copyWith(
        isRegistration: value,
      ),
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
