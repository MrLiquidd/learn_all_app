import 'package:learn_all/core/commundomain/entities/entitties.dart';
import 'package:learn_all/features/auth/data/data.dart';
import 'package:learn_all/features/auth/domain/domain.dart';

abstract class AuthFirebaseService {
  Future<ApiResultModel<String>> signUp(
      {required CreateUserReq? createUserReq});

  Future<ApiResultModel<String>> signIn(
      {required SigninUserReq? signinUserReq});

}
