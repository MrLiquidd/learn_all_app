import 'package:injectable/injectable.dart';
import 'package:learn_all/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:learn_all/features/auth/data/models/auth/create_user_req.dart';
import 'package:learn_all/features/auth/data/models/auth/signin_user_req.dart';
import 'package:learn_all/features/auth/data/sources/remote_datasources/auth/auth_firebase_service.dart';
import 'package:learn_all/features/auth/domain/repository/auth/auth.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authFirebaseService);

  final AuthFirebaseService authFirebaseService;

  @override
  Future<ApiResultModel<String>> getUser() {
    throw UnimplementedError();
  }

  @override
  Future<ApiResultModel<String>> signIn({SigninUserReq? signinUserReq}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResultModel<String>> signUp({CreateUserReq? createUserReq}) {
    throw UnimplementedError();
  }
}
