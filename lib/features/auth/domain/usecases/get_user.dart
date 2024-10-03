import 'package:injectable/injectable.dart';
import 'package:learn_all/core/commundomain/commundomain.dart';
import 'package:learn_all/features/auth/domain/domain.dart';

@injectable
class GetUserUseCase implements BaseParamsUseCase<String?, NoParams> {
  GetUserUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<ApiResultModel<String?>> call(NoParams? params) {
    return authRepository.getUser();
  }
}
