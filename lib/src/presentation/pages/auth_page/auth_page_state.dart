import 'package:equatable/equatable.dart';
import 'package:layerbit_oraculum_flutter/src/features/auth/domain/models/auth_model.dart';

class AuthPageState extends Equatable {
  final bool isLoading;
  final bool isLogin;
  final bool isPass;
  final bool isShowPass;
  final bool isRegistration;
  final String registrationMessage;
  AuthModel? authModel = AuthModel.empty();

  AuthPageState({
    this.isLoading = false,
    this.isLogin = false,
    this.isPass = false,
    this.isShowPass = true,
    this.isRegistration = false,
    this.registrationMessage = '',
    this.authModel,
  });

  @override
  List<Object?> get props => [
    isLoading,
    isLogin,
    isPass,
    isShowPass,
    isRegistration,
    registrationMessage,
    authModel
  ];

  AuthPageState copyWith({
    bool? isLoading,
    bool? isLogin,
    bool? isPass,
    bool? isShowPass,
    bool? isRegistration,
    String? registrationMessage,
    AuthModel? authModel,
  }) {
    return AuthPageState(
      isLoading: isLoading ?? this.isLoading,
      isLogin: isLogin ?? this.isLogin,
      isPass: isPass ?? this.isPass,
      isShowPass: isShowPass ?? this.isShowPass,
      isRegistration: isRegistration ?? this.isRegistration,
      registrationMessage: registrationMessage ?? this.registrationMessage,
      authModel: authModel ?? this.authModel,
    );
  }
}