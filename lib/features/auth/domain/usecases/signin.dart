import 'package:learn_all/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:learn_all/core/commundomain/usecases/base_params_usecase.dart';
import 'package:learn_all/features/auth/data/models/auth/signin_user_req.dart';
import 'package:learn_all/features/auth/domain/repository/auth/auth.dart';

class SigninUseCase implements BaseParamsUseCase<String, SigninUserReq> {
  SigninUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<ApiResultModel<String>> call(SigninUserReq? params) {
    return authRepository.signIn(signinUserReq: params);
  }
}
