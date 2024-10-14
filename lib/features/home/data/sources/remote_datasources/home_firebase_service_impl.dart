import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_all/core/core.dart';
import 'package:learn_all/features/auth/auth.dart';
import 'package:learn_all/features/home/data/models/user.dart';
import 'package:learn_all/features/home/data/sources/remote_datasources/home_firebase_service.dart';

@Singleton(as: HomeFirebaseService)
class HomeFirebaseServiceImpl extends HomeFirebaseService {
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
      UserEntity userEntity = userModel.toEntity();
      return ApiResultModel.success(data: userEntity);
    } catch (e) {
      return const ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(message: "An error occurred"));
    }
  }
}
