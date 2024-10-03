// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:learn_all/core/app/common/helpers/responsive_ui_helper/responsive_config.dart'
    as _i967;
import 'package:learn_all/features/auth/data/repository/auth/auth_repository_impl.dart'
    as _i1013;
import 'package:learn_all/features/auth/data/sources/remote_datasources/auth/auth_firebase_service.dart'
    as _i536;
import 'package:learn_all/features/auth/data/sources/remote_datasources/auth/auth_firebase_service_impl.dart'
    as _i555;
import 'package:learn_all/features/auth/domain/repository/auth/auth.dart'
    as _i4;
import 'package:learn_all/features/auth/domain/usecases/get_user.dart' as _i502;
import 'package:learn_all/features/auth/domain/usecases/signin.dart' as _i304;
import 'package:learn_all/features/auth/domain/usecases/signup.dart' as _i691;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i967.ResponsiveUiConfig>(() => _i967.ResponsiveUiConfig());
    gh.singleton<_i536.AuthFirebaseService>(
        () => _i555.AuthFirebaseServiceImpl());
    gh.singleton<_i4.AuthRepository>(
        () => _i1013.AuthRepositoryImpl(gh<_i536.AuthFirebaseService>()));
    gh.factory<_i502.GetUserUseCase>(
        () => _i502.GetUserUseCase(gh<_i4.AuthRepository>()));
    gh.factory<_i304.SigninUseCase>(
        () => _i304.SigninUseCase(gh<_i4.AuthRepository>()));
    gh.factory<_i691.SignupUseCase>(
        () => _i691.SignupUseCase(gh<_i4.AuthRepository>()));
    return this;
  }
}
