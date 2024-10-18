import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_all/core/commundomain/commundomain.dart';
import 'package:learn_all/features/home/domain/domain.dart';

part 'user_cubit.freezed.dart';
part 'user_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getUserUseCase) : super(const _Loading());

  final GetUserUseCase getUserUseCase;

  Future<void> getData() async {
    final data = await getUserUseCase.call(NoParams());
    data.when(success: (data) {
      emit(_Success(data));
    }, failure: (data) {
      emit(_Failure(data));
    });
  }
}
