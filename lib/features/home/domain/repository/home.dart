import 'package:learn_all/core/commundomain/entities/based_api_result/api_result_model.dart';
import 'package:learn_all/features/home/domain/entities/entities.dart';


abstract class HomeRepository {
  Future<ApiResultModel<UserEntity?>> getUser();
  Future<ApiResultModel<List<CourseEntity?>>> getCources();
}

