import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:imen_moj/core/params/create_user_params.dart';

import '../../../features/auth/data/models/user_model.dart';

class CreateUserDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  Future<dynamic> createUser(CreateUserParams params) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      )
          .timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          throw 'خطا در ارتباط با سرور،لطفا مجدد تلاش نمایید';
        },
      );
      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;
        UserModel user = UserModel(
          uid: uid,
          name: params.fullName,
          email: params.email,
          avatar: params.userAvatar,
        );
        await _dbRef.child("users").push().set(user.toMap());
        return user;
      }
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.message}");
      throw _handleFirebaseAuthException(e);
    } catch (e, stackTrace) {
      log("Unexpected error during login: $e", stackTrace: stackTrace);
      throw "خطای غیر منتظره ای رخ داد. لطفا دوباره تلاش نمایید";
    }
  }

  String _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case "invalid-email":
        return "ایمیل وارد شده نامعتبر است.";
      case "user-disabled":
        return "حساب کاربری شما غیرفعال شده است.";
      case "user-not-found":
        return "کاربری با این ایمیل یافت نشد.";
      case "invalid-credential":
        return "رمز عبور نادرست است.";
      case "email-already-in-use":
        return "کاربری با این مشخصات وجود دارد";
      default:
        return "ورود ناموفق. لطفا بعدا تلاش نمایید.";
    }
  }
}
