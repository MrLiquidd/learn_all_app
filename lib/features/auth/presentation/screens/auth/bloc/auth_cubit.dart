import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_all/core/commundomain/entitties/entitties.dart';
import 'package:learn_all/features/auth/data/models/models.dart';
import 'package:learn_all/features/auth/domain/usecases/usecases.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.signupUseCase, this.signinUseCase) : super(const _Loading());

  final SignupUseCase signupUseCase;
  final SigninUseCase signinUseCase;

  Future<void> signUp(CreateUserReq? createUserReq) async {
    emit(const _Loading());
    final data = await signupUseCase.call(createUserReq);

    data.when(success: (data) {
      emit(_Success(data));
    }, failure: (data) {
      emit(_Failure(data));
    });
  }

  Future<void> signIn(SigninUserReq? signInUserReq) async {
    emit(const _Loading());
    final data = await signinUseCase.call(signInUserReq);

    data.when(success: (data) {
      emit(_Success(data));
    }, failure: (data) {
      emit(_Failure(data));
    });
  }
}
