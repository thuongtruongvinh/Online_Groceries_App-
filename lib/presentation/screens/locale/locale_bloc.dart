import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/domain/core/app_logger.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/usecase/get_locale_usecase.dart';
import 'package:groceries_app/domain/usecase/set_locale_usecase.dart';
import 'package:groceries_app/presentation/screens/locale/locale_event.dart';
import 'package:groceries_app/presentation/screens/locale/locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final GetLocaleUsecase _getLocaleUsecase;
  final AppLogger appLogger;
  final SetLocaleUsecase _setLocaleUsecase;

  LocaleBloc(this._getLocaleUsecase, this._setLocaleUsecase, this.appLogger)
    : super(const LocaleState()) {
    on<OnGetLocaleEvent>(_onGetLocaleEvent);
    on<OnChangeLocaleEvent>(_onChangeLocaleEvent);
    add(OnGetLocaleEvent());
  }

  Future<void> _onGetLocaleEvent(
    OnGetLocaleEvent event,
    Emitter<LocaleState> emit,
  ) async {
    try {
      final result = await _getLocaleUsecase.call(NoParams());
      result.fold(
        (failure) => {
          appLogger.e(
            'Failed to get locale: ${failure.cause}',
            metadata: {'_onGetLocaleEvent': failure.cause.toString()},
            stackTrace: failure.stackTrace,
          ),
          emit(state.copyWith(isVietnamese: false)),
        },
        (success) {
          if (success == 'vi') {
            emit(state.copyWith(isVietnamese: true));
          } else {
            emit(state.copyWith(isVietnamese: false));
          }
        },
      );
    } catch (e) {
      appLogger.e(
        'Exception in _onGetLocaleEvent: $e',
        metadata: {'_onGetLocaleEvent': e.toString()},
      );
      emit(state.copyWith(isVietnamese: false));
    }
  }

  Future<void> _onChangeLocaleEvent(
    OnChangeLocaleEvent event,
    Emitter<LocaleState> emit,
  ) async {
    emit(state.copyWith(isVietnamese: event.localeCode == 'vi'));
    await _setLocaleUsecase.call(event.localeCode);
  }
}
