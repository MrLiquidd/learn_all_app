import 'package:learn_all/features/home/domain/entities/home/user/user.dart';

class UserModel {
  String ? fullName;
  String ? email;
  String ? imageURL;

  UserModel({
    this.fullName,
    this.email,
    this.imageURL
  });
  
   UserModel.fromJson(Map<String,dynamic> data) {
    fullName = data['name'];
    email = data['email'];
  }
}

extension UserModelX on UserModel {

  UserEntity toEntity() {
    return UserEntity(
      email: email,
      fullname: fullName,
      imageURL: imageURL
    );
  }
}