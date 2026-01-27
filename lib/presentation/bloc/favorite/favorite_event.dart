abstract class FavoriteEvent {}

class OnGetFavoriteProductsEvent extends FavoriteEvent {
  final String cartId;

  OnGetFavoriteProductsEvent(this.cartId);
}
