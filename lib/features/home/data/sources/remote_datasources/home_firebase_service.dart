import 'package:learn_all/core/commundomain/entitties/entitties.dart';
import 'package:learn_all/features/auth/domain/domain.dart';

abstract class HomeFirebaseService {
  Future<ApiResultModel<UserEntity>> getUser();
}
