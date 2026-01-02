import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final String apiErrorMessage;
  final bool isSuccess;
  final bool isHidePassword;

  const LoginState({
    this.isLoading = false,
    this.apiErrorMessage = '',
    this.isSuccess = false,
    this.isHidePassword = true,
  });

  LoginState copyWith({
    bool? isLoading,
    String? apiErrorMessage,
    bool? isSuccess,
    bool? isHidePassword,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
      isHidePassword: isHidePassword ?? this.isHidePassword,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    apiErrorMessage,
    isSuccess,
    isHidePassword,
  ];
}
