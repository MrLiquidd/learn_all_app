import 'package:learn_all/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:learn_all/core/commundomain/usecases/base_params_usecase.dart';
import 'package:learn_all/features/auth/data/models/auth/create_user_req.dart';
import 'package:learn_all/features/auth/data/models/auth/signin_user_req.dart';

abstract class AuthRepository {
  Future<ApiResultModel<String>> signUp({CreateUserReq? createUserReq});

  Future<ApiResultModel<String>> signIn({SigninUserReq? signinUserReq});

  Future<ApiResultModel<String?>> getUser();
}
