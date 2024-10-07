import 'package:learn_all/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:learn_all/features/auth/domain/entities/auth/auth.dart';

abstract class HomeRepository {
  Future<ApiResultModel<UserEntity?>> getUser();
}
