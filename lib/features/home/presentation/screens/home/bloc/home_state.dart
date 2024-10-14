part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success(UserEntity? data) = _Success;
  const factory HomeState.failure(ErrorResultModel message) = _Failure;
}