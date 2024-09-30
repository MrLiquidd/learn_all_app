import 'package:learn_all/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:learn_all/core/commundomain/usecases/base_params_usecase.dart';
import 'package:learn_all/features/auth/domain/repository/auth/auth.dart';

class GetUserUseCase implements BaseParamsUseCase<String?, NoParams> {
  GetUserUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<ApiResultModel<String?>> call(NoParams? params) {
    return authRepository.getUser();
  }
}
