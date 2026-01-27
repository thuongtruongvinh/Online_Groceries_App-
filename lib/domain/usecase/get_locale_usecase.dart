import 'package:groceries_app/domain/core/result.dart';
import 'package:groceries_app/domain/core/usecase.dart';
import 'package:groceries_app/domain/repositories/local_storage_repository.dart';

final class GetLocaleUsecase extends UsecaseAsync<String?, NoParams> {
  final ILocalStorage _localStorage;

  GetLocaleUsecase(this._localStorage);

  @override
  ResultFuture<String?> call(NoParams params) async {
    return _localStorage.getLocale();
  }
}
