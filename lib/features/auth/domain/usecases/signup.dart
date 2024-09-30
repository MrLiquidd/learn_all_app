import 'package:dartz/dartz.dart';
import 'package:learn_all/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:learn_all/core/commundomain/usecases/base_params_usecase.dart';
import 'package:learn_all/features/auth/data/models/auth/create_user_req.dart';
import 'package:learn_all/features/auth/domain/repository/auth/auth.dart';

class SignupUseCase implements BaseParamsUseCase<Either, CreateUserReq> {
  SignupUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<ApiResultModel<Either>> call(CreateUserReq? params) {
    return authRepository.signUp(createUserReq: params);
  }
}
