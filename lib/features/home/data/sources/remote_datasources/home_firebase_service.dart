import 'package:learn_all/core/commundomain/entities/entitties.dart';
import 'package:learn_all/features/home/domain/domain.dart';

abstract class HomeFirebaseService {
  Future<ApiResultModel<UserEntity>> getUser();
  Future<ApiResultModel<List<CourseEntity>>> getCourses();
}
