import 'package:groceries_app/data/models/response/cart_info_dto.dart';
import 'package:groceries_app/domain/entities/product_entity.dart';

extension CartInfoMapper on CartInfoDto {
  List<ProductEntity> toListProductEntity() {
    return products
        .map(
          (cartProduct) => ProductEntity(
            id: cartProduct.id,
            name: cartProduct.title,
            price: cartProduct.price,
            thumbnail: cartProduct.thumbnail,
          ),
        )
        .toList();
  }
}
