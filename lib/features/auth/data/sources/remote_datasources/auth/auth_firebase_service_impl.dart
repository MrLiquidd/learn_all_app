import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learn_all/app/library/constants/app_urls.dart';
import 'package:learn_all/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:learn_all/core/commundomain/entitties/based_api_result/error_result_model.dart';
import 'package:learn_all/features/auth/data/models/auth/create_user_req.dart';
import 'package:learn_all/features/auth/data/models/auth/signin_user_req.dart';
import 'package:learn_all/features/auth/data/models/auth/user.dart';
import 'package:learn_all/features/auth/data/sources/remote_datasources/auth/auth_firebase_service.dart';
import 'package:learn_all/features/auth/domain/entities/auth/user.dart';

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<ApiResultModel<String>> signIn(
      {required SigninUserReq signinUserReq}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);
      return const ApiResultModel.success(data: "Signip was successful");
    } on FirebaseAuthException catch (e) {
      String msg = "";

      if (e.code == 'invalid-email') {
        msg = "Invalid email";
      } else if (e.code == 'invalid-credential') {
        msg = "Invalid password";
      }
      return ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(message: msg));
    }
  }

  @override
  Future<ApiResultModel<String>> signUp(
      {required CreateUserReq createUserReq}) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      FirebaseFirestore.instance.collection("Users").doc(data.user?.uid).set({
        'name': createUserReq.fullname,
        'email': data.user?.email,
      });

      return const ApiResultModel.success(data: "Signup was successful");
    } on FirebaseAuthException catch (e) {
      String msg = "";

      if (e.code == 'weak-password') {
        msg = "Password must be at least 6 characters long";
      } else if (e.code == 'email-already-in-use') {
        msg = "Email already in use";
      }

      return ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(message: msg));
    }
  }

  @override
  Future<ApiResultModel<UserEntity>> getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = await firebaseFirestore
          .collection('Users')
          .doc(firebaseAuth.currentUser?.uid)
          .get();

      UserModel userModel = UserModel.fromJson(user.data()!);
      userModel.imageURL =
          firebaseAuth.currentUser?.photoURL ?? AppUrls.defaultImage;
      UserEntity userEntity = userModel.toEntity();
      return ApiResultModel.success(data: userEntity);
    } catch (e) {
      return const ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(message: "An error occurred"));
    }
  }
}
