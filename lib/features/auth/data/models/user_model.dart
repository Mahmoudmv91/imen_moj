import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.name,
    required super.email,
     super.createdAt,
    super.avatar,
  });

  factory UserModel.fromMap(User user) {
    return UserModel(
      createdAt: DateTime.now().toIso8601String(),
      uid: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      avatar: user.photoURL,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'avatar': avatar,
      'createdAt': createdAt,
    };
  }
}
