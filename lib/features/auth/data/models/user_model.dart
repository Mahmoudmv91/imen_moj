import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uid, required super.name, required super.email});

  factory UserModel.fromMap(Map<dynamic, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
    );
  }

  Map<dynamic,dynamic> toMap(){
    return {
      'uid':uid,
      'name':name,
      'email':email,
    };
  }
}
