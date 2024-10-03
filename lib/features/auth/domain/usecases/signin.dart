import 'package:injectable/injectable.dart';
import 'package:learn_all/core/commundomain/commundomain.dart';
import 'package:learn_all/features/auth/data/data.dart';
import 'package:learn_all/features/auth/domain/domain.dart';

@injectable
class SigninUseCase implements BaseParamsUseCase<String, SigninUserReq> {
  SigninUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<ApiResultModel<String>> call(SigninUserReq? params) {
    return authRepository.signIn(signinUserReq: params);
  }
}
