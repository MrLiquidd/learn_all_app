import 'package:injectable/injectable.dart';
import 'package:learn_all/core/core.dart';
import 'package:learn_all/features/home/domain/domain.dart';

@injectable
class GetCourcesUseCase implements BaseParamsUseCase<List<CourseEntity?> , NoParams> {
  GetCourcesUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<ApiResultModel<List<CourseEntity?>>> call(NoParams? params) {
    return homeRepository.getCources();
  }

}