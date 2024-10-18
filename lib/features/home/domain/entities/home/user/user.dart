// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class UserEntity {
  @HiveField(0)
  String? fullname;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? imageURL;

  UserEntity({this.fullname, this.email, this.imageURL});

  UserEntity copyWith({
    String? fullname,
    String? email,
    String? imageURL,
  }) {
    return UserEntity(
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      imageURL: imageURL ?? this.imageURL,
    );
  }
}