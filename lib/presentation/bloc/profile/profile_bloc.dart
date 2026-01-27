import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/domain/core/app_logger.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/usecase/get_user_info_usecase.dart';
import 'package:groceries_app/presentation/bloc/profile/profile_event.dart';
import 'package:groceries_app/presentation/bloc/profile/profile_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserInfoUsecase getUserInfoUsecase;
  final FailureMapper failureMapper;
  final AppLogger appLogger;

  ProfileBloc(this.getUserInfoUsecase, this.failureMapper, this.appLogger)
    : super(const ProfileState()) {
    on<OnLoadUserInfoEvent>(_getUserInfo);

    on<OnLogoutEvent>((event, emit) {
      // Handle logout
    });

    on<OnEditProfileEvent>((event, emit) {
      // Handle edit profile
    });
  }

  /// Get user info
  Future<void> _getUserInfo(
    OnLoadUserInfoEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await getUserInfoUsecase.call(NoParams());
      result.fold(
        (failure) {
          appLogger.e(
            'Failed to load user info: ${failure.cause}',
            metadata: {'_getUserInfo': failure.cause.toString()},
            stackTrace: failure.stackTrace,
          );
          emit(
            state.copyWith(
              apiErrorMessage: failureMapper.mapFailureToMessage(failure),
            ),
          );
        },
        (success) {
          emit(state.copyWith(userInfo: success));
        },
      );
    } catch (e) {
      emit(state.copyWith(apiErrorMessage: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
