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
    as _i830;
import 'package:learn_all/features/auth/auth.dart' as _i1044;
import 'package:learn_all/features/auth/data/repository/auth/auth_repository_impl.dart'
    as _i1013;
import 'package:learn_all/features/auth/data/sources/remote_datasources/auth_firebase_service_impl.dart'
    as _i151;
import 'package:learn_all/features/auth/domain/domain.dart' as _i226;
import 'package:learn_all/features/auth/domain/repository/repository.dart'
    as _i553;
import 'package:learn_all/features/auth/domain/usecases/signin.dart' as _i304;
import 'package:learn_all/features/auth/domain/usecases/signup.dart' as _i691;
import 'package:learn_all/features/auth/domain/usecases/usecases.dart' as _i876;
import 'package:learn_all/features/auth/presentation/screens/auth/bloc/auth_cubit.dart'
    as _i240;
import 'package:learn_all/features/home/data/repository/home_repository_impl.dart'
    as _i952;
import 'package:learn_all/features/home/data/sources/remote_datasources/home_firebase_service.dart'
    as _i801;
import 'package:learn_all/features/home/data/sources/remote_datasources/home_firebase_service_impl.dart'
    as _i728;
import 'package:learn_all/features/home/domain/domain.dart' as _i120;
import 'package:learn_all/features/home/domain/repository/repository.dart'
    as _i67;
import 'package:learn_all/features/home/domain/usecases/get_user.dart' as _i474;
import 'package:learn_all/features/home/presentation/screens/home/bloc/home_cubit.dart'
    as _i778;
import 'package:learn_all/utils/services/hive/hive.dart' as _i619;
import 'package:learn_all/utils/services/hive/main_box.dart' as _i314;

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
    gh.singleton<_i830.ResponsiveUiConfig>(() => _i830.ResponsiveUiConfig());
    gh.singleton<_i314.MainBoxMixin>(() => _i314.MainBoxMixin());
    gh.singleton<_i801.HomeFirebaseService>(
        () => _i728.HomeFirebaseServiceImpl());
    gh.singleton<_i1044.AuthFirebaseService>(
        () => _i151.AuthFirebaseServiceImpl());
    gh.singleton<_i67.HomeRepository>(
        () => _i952.HomeRepositoryImpl(gh<_i801.HomeFirebaseService>()));
    gh.singleton<_i1044.AuthRepository>(() => _i1013.AuthRepositoryImpl(
          gh<_i1044.AuthFirebaseService>(),
          gh<_i619.MainBoxMixin>(),
        ));
    gh.factory<_i691.SignupUseCase>(
        () => _i691.SignupUseCase(gh<_i553.AuthRepository>()));
    gh.factory<_i304.SigninUseCase>(
        () => _i304.SigninUseCase(gh<_i226.AuthRepository>()));
    gh.factory<_i474.GetUserUseCase>(
        () => _i474.GetUserUseCase(gh<_i67.HomeRepository>()));
    gh.factory<_i240.AuthCubit>(() => _i240.AuthCubit(
          gh<_i876.SignupUseCase>(),
          gh<_i876.SigninUseCase>(),
        ));
    gh.factory<_i778.HomeCubit>(
        () => _i778.HomeCubit(gh<_i120.GetUserUseCase>()));
    return this;
  }
}
