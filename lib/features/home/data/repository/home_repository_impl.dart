import 'package:injectable/injectable.dart';
import 'package:learn_all/core/core.dart';
import 'package:learn_all/features/auth/auth.dart';
import 'package:learn_all/features/home/data/sources/remote_datasources/home_firebase_service.dart';
import 'package:learn_all/features/home/domain/repository/repository.dart';
import 'package:learn_all/utils/helpers/helpers.dart';

@Singleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this.homeFirebaseService);

  final HomeFirebaseService homeFirebaseService;

  @override
  Future<ApiResultModel<UserEntity?>> getUser() async {
    try {
      final ApiResultModel<UserEntity> _result =
          await homeFirebaseService.getUser();
      return _result.when(
        success: (UserEntity result) {
          return ApiResultModel<UserEntity>.success(data: result);
        },
        failure: (ErrorResultModel errorResultModel) {
          return ApiResultModel<UserEntity>.failure(
              errorResultEntity: errorResultModel);
        },
      );
    } on CustomConnectionException catch (_) {
      throw UnimplementedError();
    }
  }
}
