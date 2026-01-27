import 'package:groceries_app/data/core/guard.dart';
import 'package:groceries_app/data/datasources/remote/api_service.dart';
import 'package:groceries_app/data/mappers/cart_info_mapper.dart';
import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/entities/product_entity.dart';
import 'package:groceries_app/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ICartRepository)
class CartRepositoryImpl extends ICartRepository {
  final ApiService _apiService;

  CartRepositoryImpl(this._apiService);

  @override
  ResultFuture<List<ProductEntity>> getFavoriteProducts(String id) {
    return guardDio<List<ProductEntity>>(() async {
      final dto = await _apiService.getCartInfo(id);
      return dto.toListProductEntity();
    });
  }
}
