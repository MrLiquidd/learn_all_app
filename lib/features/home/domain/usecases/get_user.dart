import 'package:injectable/injectable.dart';
import 'package:learn_all/core/commundomain/commundomain.dart';
import 'package:learn_all/features/home/domain/domain.dart';

@injectable
class GetUserUseCase implements BaseParamsUseCase<UserEntity?, NoParams> {
  GetUserUseCase(this.homeRepository);

  final HomeRepository homeRepository;
  
  @override
  Future<ApiResultModel<UserEntity?>> call(NoParams? params) {
    return homeRepository.getUser();
  }
}
