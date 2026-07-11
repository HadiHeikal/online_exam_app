// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/api/client/auth_api_client.dart' as _i213;
import '../../features/auth/api/data_source_impl/remote/auth_remote_data_source_impl.dart'
    as _i319;
import '../../features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i548;
import '../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i279;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/use_cases/register_use_case.dart' as _i1010;
import '../../features/auth/presentation/register/manager/register_cubit.dart'
    as _i784;
import '../dio/dio_module.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    gh.singleton<_i213.AuthApiClient>(
      () => _i213.AuthApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i548.AuthRemoteDataSource>(
      () => _i319.AuthRemoteDataSourceImpl(gh<_i213.AuthApiClient>()),
    );
    gh.lazySingleton<_i170.AuthRepo>(
      () => _i279.AuthRepoImpl(gh<_i548.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i1010.RegisterUseCase>(
      () => _i1010.RegisterUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i784.RegisterCubit>(
      () => _i784.RegisterCubit(gh<_i1010.RegisterUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
