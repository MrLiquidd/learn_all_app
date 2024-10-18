part of 'my_course_cubit.dart';

@freezed
class MyCourseState with _$MyCourseState {
  const factory MyCourseState.loading() = _Loading;
  const factory MyCourseState.success(List<CourseEntity?>? data) = _Success;
  const factory MyCourseState.failure(ErrorResultModel message) = _Failure;
}
