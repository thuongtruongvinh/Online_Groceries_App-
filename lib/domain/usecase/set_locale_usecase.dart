import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/repositories/local_storage_repository.dart';

final class SetLocaleUsecase extends UsecaseAsync<void, String> {
  final ILocalStorage _localStorage;

  SetLocaleUsecase(this._localStorage);

  @override
  ResultFuture<void> call(String localeCode) async {
    return _localStorage.setLocale(localeCode);
  }
}
