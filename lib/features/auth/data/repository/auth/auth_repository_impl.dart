import 'package:injectable/injectable.dart';
import 'package:learn_all/core/core.dart';
import 'package:learn_all/features/auth/auth.dart';
import 'package:learn_all/utils/helpers/helpers.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authFirebaseService);

  final AuthFirebaseService authFirebaseService;

  @override
  Future<ApiResultModel<String>> signIn({SigninUserReq? signinUserReq}) async {
    try {
      final ApiResultModel<String> _result =
          await authFirebaseService.signIn(signinUserReq: signinUserReq);
      return _result.when(
        success: (String result) {
          return ApiResultModel<String>.success(data: result);
        },
        failure: (ErrorResultModel errorResultModel) {
          return ApiResultModel<String>.failure(
              errorResultEntity: errorResultModel);
        },
      );
    } on CustomConnectionException catch (_) {
      throw UnimplementedError();
    }
  }

  @override
  Future<ApiResultModel<String>> signUp({CreateUserReq? createUserReq}) async {
    try {
      final ApiResultModel<String> _result =
          await authFirebaseService.signUp(createUserReq: createUserReq);
      return _result.when(
        success: (String result) {
          return ApiResultModel<String>.success(data: result);
        },
        failure: (ErrorResultModel errorResultModel) {
          return ApiResultModel<String>.failure(
              errorResultEntity: errorResultModel);
        },
      );
    } on CustomConnectionException catch (_) {
      throw UnimplementedError();
    }
  }
}
