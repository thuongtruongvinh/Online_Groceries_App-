import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/domain/core/app_logger.dart';
import 'package:groceries_app/domain/usecase/get_favorite_product_usecase.dart';
import 'package:groceries_app/presentation/bloc/favorite/favorite_event.dart';
import 'package:groceries_app/presentation/bloc/favorite/favorite_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoriteProductUsecase _getFavoriteProductUsecase;
  final FailureMapper failureMapper;
  final AppLogger appLogger;

  FavoriteBloc(
    this._getFavoriteProductUsecase,
    this.failureMapper,
    this.appLogger,
  ) : super(const FavoriteState()) {
    on<OnGetFavoriteProductsEvent>(_onGetFavoriteProductsEvent);
  }

  Future<void> _onGetFavoriteProductsEvent(
    OnGetFavoriteProductsEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, apiErrorMessage: ''));
      final result = await _getFavoriteProductUsecase.call(event.cartId);
      result.fold(
        (failure) {
          appLogger.e(
            'Failed to get favorite products: ${failure.cause}',
            metadata: {'_onGetFavoriteProductsEvent': failure.cause.toString()},
            stackTrace: failure.stackTrace,
          );
          emit(
            state.copyWith(
              isLoading: false,
              apiErrorMessage: failureMapper.mapFailureToMessage(failure),
            ),
          );
        },
        (data) {
          emit(state.copyWith(isLoading: false, favoriteProducts: data));
        },
      );
    } catch (e) {
      appLogger.e(
        'Exception in _onGetFavoriteProductsEvent: $e',
        metadata: {'_onGetFavoriteProductsEvent': e.toString()},
      );
      emit(
        state.copyWith(
          isLoading: false,
          apiErrorMessage: 'An unexpected error occurred.',
        ),
      );
    }
  }
}
