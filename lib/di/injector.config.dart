// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:groceries_app/core/env/app_config.dart' as _i612;
import 'package:groceries_app/core/logging/console_app_logger.dart' as _i697;
import 'package:groceries_app/data/core/interceptors.dart' as _i122;
import 'package:groceries_app/data/datasources/local/local_storage_datasource.dart'
    as _i388;
import 'package:groceries_app/data/datasources/local/local_storage_datasource_impl.dart'
    as _i301;
import 'package:groceries_app/data/datasources/remote/api_service.dart'
    as _i138;
import 'package:groceries_app/data/repositories/auth_repository_impl.dart'
    as _i774;
import 'package:groceries_app/data/repositories/local_storage_impl.dart'
    as _i821;
import 'package:groceries_app/di/domain_module.dart' as _i306;
import 'package:groceries_app/di/env_module.dart' as _i116;
import 'package:groceries_app/di/third_party_module.dart' as _i202;
import 'package:groceries_app/domain/core/app_logger.dart' as _i649;
import 'package:groceries_app/domain/repositories/auth_repository.dart'
    as _i345;
import 'package:groceries_app/domain/repositories/local_storage_repository.dart'
    as _i378;
import 'package:groceries_app/domain/usecase/get_user_info_usecase.dart'
    as _i1062;
import 'package:groceries_app/domain/usecase/login_user_usecase.dart' as _i644;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _dev = 'dev';
const String _staging = 'staging';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyModule = _$ThirdPartyModule();
    final envModule = _$EnvModule();
    final domainModule = _$DomainModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => thirdPartyModule.prefs,
      preResolve: true,
    );
    gh.factory<_i558.FlutterSecureStorage>(
      () => thirdPartyModule.secureStorage(),
    );
    gh.lazySingleton<_i649.AppLogger>(() => _i697.ConsoleAppLogger());
    gh.singleton<_i612.AppConfig>(
      () => envModule.devConfig(),
      registerFor: {_dev},
    );
    gh.singleton<_i612.AppConfig>(
      () => envModule.stagingConfig(),
      registerFor: {_staging},
    );
    gh.singleton<_i388.ILocalStorageDataSource>(
      () => _i301.LocalStorageDataSourceImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<String>(
      () => envModule.devBaseUrl(gh<_i612.AppConfig>()),
      instanceName: 'baseUrl',
      registerFor: {_dev},
    );
    gh.factory<String>(
      () => envModule.stagingBaseUrl(gh<_i612.AppConfig>()),
      instanceName: 'baseUrl',
      registerFor: {_staging},
    );
    gh.singleton<_i612.AppConfig>(
      () => envModule.prodConfig(),
      registerFor: {_prod},
    );
    gh.factory<String>(
      () => envModule.prodBaseUrl(gh<_i612.AppConfig>()),
      instanceName: 'baseUrl',
      registerFor: {_prod},
    );
    gh.singleton<_i378.ILocalStorage>(
      () => _i821.LocalStorageImpl(gh<_i388.ILocalStorageDataSource>()),
    );
    gh.lazySingleton<_i122.NetworkInterceptor>(
      () => _i122.NetworkInterceptor(
        gh<_i378.ILocalStorage>(),
        gh<_i649.AppLogger>(),
      ),
    );
    gh.factory<_i361.Dio>(
      () => thirdPartyModule.dio(
        gh<_i612.AppConfig>(),
        gh<String>(instanceName: 'baseUrl'),
        gh<_i122.NetworkInterceptor>(),
      ),
    );
    gh.lazySingleton<_i138.ApiService>(() => _i138.ApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i345.IAuthRepository>(
      () => _i774.AuthRepositoryImpl(gh<_i138.ApiService>()),
    );
    gh.factory<_i644.LoginUserUsecase>(
      () => domainModule.loginUserUsecase(gh<_i345.IAuthRepository>()),
    );
    gh.factory<_i1062.GetUserInfoUsecase>(
      () => domainModule.getUserInfoUsecase(gh<_i345.IAuthRepository>()),
    );
    return this;
  }
}

class _$ThirdPartyModule extends _i202.ThirdPartyModule {}

class _$EnvModule extends _i116.EnvModule {}

class _$DomainModule extends _i306.DomainModule {}
