import 'package:shamsi_date/shamsi_date.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.name,
    required super.email,
    super.createdAt,
    super.avatar,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      avatar: data['avatar'] ?? '',
      createdAt: data['createdAt'] ?? '',
    );
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'avatar': avatar,
      'createdAt': '${Jalali.now().formatter.d} ${Jalali.now().formatter.mN} ${Jalali.now().formatter.y}',
    };
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      name: entity.name,
      email: entity.email,
      avatar: entity.avatar,
      createdAt: entity.createdAt,
    );
  }
}
