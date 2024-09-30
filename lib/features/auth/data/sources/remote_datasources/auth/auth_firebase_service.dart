import 'package:learn_all/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:learn_all/features/auth/data/models/auth/create_user_req.dart';
import 'package:learn_all/features/auth/data/models/auth/signin_user_req.dart';
import 'package:learn_all/features/auth/domain/entities/auth/user.dart';

abstract class AuthFirebaseService {

  Future<ApiResultModel<String>> signUp({required CreateUserReq createUserReq});

  Future<ApiResultModel<String>> signIn({required SigninUserReq signinUserReq});

  Future<ApiResultModel<UserEntity>> getUser();
}
