import 'package:learn_all/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:learn_all/features/auth/data/models/models.dart';


abstract class AuthRepository {
  Future<ApiResultModel<String>> signUp({CreateUserReq? createUserReq});

  Future<ApiResultModel<String>> signIn({SigninUserReq? signinUserReq});

  Future<ApiResultModel<String?>> getUser();
}
