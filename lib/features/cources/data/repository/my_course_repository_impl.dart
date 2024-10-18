import 'package:injectable/injectable.dart';
import 'package:learn_all/core/commundomain/entities/based_api_result/api_result_model.dart';
import 'package:learn_all/features/cources/cources.dart';

@Singleton(as: MyCourseRepository)
class MyCourseRepositoryImpl implements MyCourseRepository {
  MyCourseRepositoryImpl(this.localDatabase);

  final LocalDatabase localDatabase;

  @override
  Future<ApiResultModel<List<UserCourseEntity?>?>> getCources() async {
    final List<UserCourseEntity?>? data = await localDatabase.getCources();
    return ApiResultModel<List<UserCourseEntity?>?>.success(data: data);
  }
}
