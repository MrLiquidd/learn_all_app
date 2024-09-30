import 'package:dartz/dartz.dart';
import 'package:learn_all/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:learn_all/features/auth/data/models/auth/create_user_req.dart';
import 'package:learn_all/features/auth/data/models/auth/signin_user_req.dart';

abstract class AuthRepository {
  Future<ApiResultModel<Either>> signUp({CreateUserReq? createUserReq});

  Future<ApiResultModel<Either>> signIn({SigninUserReq? signinUserReq});

  Future<ApiResultModel<Either>> getUser();
}
