import 'signin_user_req.dart';

class CreateUserReq extends SigninUserReq {
  final String fullname;

  CreateUserReq({
    required this.fullname,
    required super.email,
    required super.password,
  });
}
