import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_all/core/commundomain/commundomain.dart';
import 'package:learn_all/features/home/domain/domain.dart';

part 'my_course_cubit.freezed.dart';
part 'my_course_state.dart';

@injectable
class MyCourseCubit extends Cubit<MyCourseState> {
  MyCourseCubit(this.getCourcesUseCase) : super(const _Loading());

  final GetCourcesUseCase getCourcesUseCase;

  Future<void> getData() async {
    final cources = await getCourcesUseCase.call(NoParams());
    cources.when(success: (data) {
      emit(_Success(data));
    }, failure: (data) {
      emit(_Failure(data));
    });
  }
}
