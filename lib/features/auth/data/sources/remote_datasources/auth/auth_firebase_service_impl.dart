import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_all/core/core.dart';
import 'package:learn_all/features/auth/auth.dart';


@Singleton(as: AuthFirebaseService)
class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<ApiResultModel<String>> signIn({SigninUserReq? signinUserReq}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq?.email ?? "",
          password: signinUserReq?.password ?? "");
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
  Future<ApiResultModel<String>> signUp({CreateUserReq? createUserReq}) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq?.email ?? "",
          password: createUserReq?.password ?? "");

      FirebaseFirestore.instance.collection("Users").doc(data.user?.uid).set({
        'name': createUserReq?.fullname ?? "",
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
