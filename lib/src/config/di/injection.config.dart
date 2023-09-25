// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_clean_architecture_template/src/config/di/app_module.dart'
    as _i8;
import 'package:flutter_clean_architecture_template/src/data/datasources/remote/joke_api_service.dart'
    as _i4;
import 'package:flutter_clean_architecture_template/src/data/repositories/joke_repository_impl.dart'
    as _i6;
import 'package:flutter_clean_architecture_template/src/domain/repositories/joke_repository.dart'
    as _i5;
import 'package:flutter_clean_architecture_template/src/presentation/cubits/joke/joke_cubit.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.singleton<_i3.Dio>(appModule.dio);
    gh.factory<_i4.JokeApiService>(() => _i4.JokeApiService(gh<_i3.Dio>()));
    gh.lazySingleton<_i5.JokeRepository>(
        () => _i6.JokeRepositoryImpl(gh<_i4.JokeApiService>()));
    gh.factory<_i7.JokeCubit>(() => _i7.JokeCubit(gh<_i5.JokeRepository>()));
    return this;
  }
}

class _$AppModule extends _i8.AppModule {}
