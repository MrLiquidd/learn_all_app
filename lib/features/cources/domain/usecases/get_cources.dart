import 'package:injectable/injectable.dart';
import 'package:learn_all/core/core.dart';
import 'package:learn_all/features/cources/cources.dart';

@injectable
class GetCourcesUseCase implements BaseParamsUseCase<List<UserCourseEntity?>? , NoParams> {
  GetCourcesUseCase(this.myCourseRepository);

  final MyCourseRepository myCourseRepository;

  @override
  Future<ApiResultModel<List<UserCourseEntity?>?>> call(NoParams? params) {
    return myCourseRepository.getCources();
  }

}