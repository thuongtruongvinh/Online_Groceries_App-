import 'package:groceries_app/domain/repositories/cart_repository.dart';
import 'package:groceries_app/domain/repositories/local_storage_repository.dart';
import 'package:groceries_app/domain/usecase/get_favorite_product_usecase.dart';
import 'package:groceries_app/domain/usecase/get_locale_usecase.dart';
import 'package:groceries_app/domain/usecase/get_user_info_usecase.dart';
import 'package:groceries_app/domain/usecase/set_locale_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:groceries_app/domain/repositories/auth_repository.dart';
import 'package:groceries_app/domain/usecase/login_user_usecase.dart';

/// Domain module that provides dependency injection for use cases.
///
/// This module defines how to create and inject domain layer use cases
/// with their required repository dependencies. It uses the @module
/// annotation to mark this class as a dependency injection module.
///
/// Each method in this module is responsible for creating a specific
/// use case instance with its required dependencies injected.
@module
abstract class DomainModule {
  @Injectable()
  LoginUserUsecase loginUserUsecase(IAuthRepository repo) {
    return LoginUserUsecase(repo);
  }

  @Injectable()
  GetUserInfoUsecase getUserInfoUsecase(IAuthRepository repo) {
    return GetUserInfoUsecase(repo);
  }

  @Injectable()
  GetLocaleUsecase getLocaleUsecase(ILocalStorage repo) {
    return GetLocaleUsecase(repo);
  }

  @Injectable()
  SetLocaleUsecase saveLocaleUsecase(ILocalStorage repo) {
    return SetLocaleUsecase(repo);
  }

  @Injectable()
  GetFavoriteProductUsecase getFavoriteProductUsecase(ICartRepository repo) {
    return GetFavoriteProductUsecase(repo);
  }
}
