import 'package:injectable/injectable.dart';
import 'package:learn_all/core/core.dart';
import 'package:learn_all/features/home/data/sources/remote_datasources/home_firebase_service.dart';
import 'package:learn_all/features/home/domain/domain.dart';
import 'package:learn_all/utils/helpers/helpers.dart';
import 'package:learn_all/utils/services/hive/main_box.dart';

@Singleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this.homeFirebaseService, this.mainBoxMixin);

  final HomeFirebaseService homeFirebaseService;
  final MainBoxMixin mainBoxMixin;

  @override
  Future<ApiResultModel<UserEntity?>> getUser() async {
    try {
      final ApiResultModel<UserEntity> _result =
          await homeFirebaseService.getUser();
      return _result.when(
        success: (UserEntity result) {
          mainBoxMixin.addData(MainBoxKeys.user, result);
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

  @override
  Future<ApiResultModel<List<CourseEntity>>> getCources() async {
    try {
      final ApiResultModel<List<CourseEntity>> _result =
          await homeFirebaseService.getCourses();
      return _result.when(
        success: (List<CourseEntity> result) {
          mainBoxMixin.addData(MainBoxKeys.courses, result);

          return ApiResultModel<List<CourseEntity>>.success(data: result);
        },
        failure: (ErrorResultModel errorResultModel) {
          return ApiResultModel<List<CourseEntity>>.failure(
              errorResultEntity: errorResultModel);
        },
      );
    } on CustomConnectionException catch (_) {
      throw UnimplementedError();
    }
  }
}
