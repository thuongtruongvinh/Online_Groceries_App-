import 'package:json_annotation/json_annotation.dart';
part 'cart_info_dto.g.dart';

@JsonSerializable()
class CartInfoDto {
  final int id;
  final List<CartProductDto> products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  CartInfoDto({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory CartInfoDto.fromJson(Map<String, dynamic> json) =>
      _$CartInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartInfoDtoToJson(this);
}

@JsonSerializable()
class CartProductDto {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedTotal;
  final String thumbnail;

  CartProductDto({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory CartProductDto.fromJson(Map<String, dynamic> json) =>
      _$CartProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductDtoToJson(this);
}
