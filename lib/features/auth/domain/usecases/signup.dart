import 'package:injectable/injectable.dart';
import 'package:learn_all/core/commundomain/commundomain.dart';
import 'package:learn_all/features/auth/data/models/models.dart';
import 'package:learn_all/features/auth/domain/repository/repository.dart';

@injectable
class SignupUseCase implements BaseParamsUseCase<String, CreateUserReq> {
  SignupUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<ApiResultModel<String>> call(CreateUserReq? params) {
    return authRepository.signUp(createUserReq: params);
  }
}
