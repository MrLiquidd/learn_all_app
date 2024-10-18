import 'package:learn_all/core/commundomain/entities/entitties.dart';
import 'package:learn_all/features/features.dart';

abstract class MyCourseRepository {
  Future<ApiResultModel<List<UserCourseEntity?>?>> getCources();
}