import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/entities/product_entity.dart';

abstract class ICartRepository {
  ResultFuture<List<ProductEntity>> getFavoriteProducts(String id);
}
