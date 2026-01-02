import 'package:equatable/equatable.dart';
import 'package:groceries_app/domain/entities/user_info_entity.dart';

class ProfileState extends Equatable {
  final bool isLoading;
  final String apiErrorMessage;
  final UserInfoEntity? userInfo;

  const ProfileState({
    this.isLoading = false,
    this.apiErrorMessage = '',
    this.userInfo,
  });

  ProfileState copyWith({
    bool? isLoading,
    String? apiErrorMessage,
    UserInfoEntity? userInfo,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  @override
  List<Object?> get props => [isLoading, apiErrorMessage, userInfo];
}
