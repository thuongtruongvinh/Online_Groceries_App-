import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/entities/product_entity.dart';
import 'package:groceries_app/domain/repositories/cart_repository.dart';

final class GetFavoriteProductUsecase
    extends UsecaseAsync<List<ProductEntity>, String> {
  final ICartRepository _cartRepository;

  GetFavoriteProductUsecase(this._cartRepository);

  @override
  ResultFuture<List<ProductEntity>> call(String params) {
    return _cartRepository.getFavoriteProducts(params);
  }
}
