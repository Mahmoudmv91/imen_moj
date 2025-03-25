import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:imen_moj/features/auth/data/models/user_model.dart';
import 'package:imen_moj/features/auth/data/params/login_params.dart';
import 'package:imen_moj/features/auth/data/params/register_params.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  Future<dynamic> register(RegisterParams params) async {
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
        await _dbRef.child("user").child(uid).set(user.toMap());
        return user;
      }
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.message}");
      throw _handleFirebaseAuthException(e);
    } catch (e, stackTrace) {
      log("Unexpected error during login: $e", stackTrace: stackTrace);
      throw Exception("خطای غیر منتظره ای رخ داد. لطفا دوباره تلاش نمایید");
    }
    // UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
    //   email: params.email,
    //   password: params.password,
    // );
    // if (userCredential.user != null) {
    //   String uid = userCredential.user!.uid;
    //   UserModel user = UserModel(uid: uid, name: name, email: email);
    //   await _dbRef.child("users").child(uid).set(user.toMap());
    //   return user;
    // }
    // return null;
  }

  Future<dynamic> login(LoginParams params) async {
    try {
      return await _auth
          .signInWithEmailAndPassword(
            email: params.email,
            password: params.password,
          )
          .timeout(
            const Duration(seconds: 5),
          );
    } on TimeoutException catch (e) {
      log("TimeoutException: ${e.message}");
      throw 'خطا در ارتباط با سرور،لطفا مجدد تلاش نمایید';
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.message}");
      throw _handleFirebaseAuthException(e);
    } catch (e, stackTrace) {
      log("Unexpected error during login: $e", stackTrace: stackTrace);
      throw "خطای غیر منتظره ای رخ داد. لطفا دوباره تلاش نمایید";
    }
  }

  // Future<dynamic> getUsers() async {
  //   if (userCredential.user != null) {
  //     String uid = userCredential.user!.uid;
  //     _dbRef.child("user").
  //     DatabaseEvent event = await _dbRef.child("user").child(uid).once();
  //     Map userData = event.snapshot.value as Map<dynamic, dynamic>;
  //     userData.addAll({'uid':uid});
  //     return userData;
  //     // return UserModel.fromMap(userData, uid);
  //   }
  //   return null;
  // }

  Future<void> logout() async {
    await _auth.signOut();
  }

  // Future<UserModel?> getCurrentUser() async {
  //   User? user = _auth.currentUser;
  //   if (user != null) {
  //     DatabaseEvent event = await _dbRef.child("user").child(user.uid).once();
  //     Map<dynamic, dynamic> userData = event.snapshot.value as Map<dynamic, dynamic>;
  //     userData.addAll({'uid': user.uid});
  //     return UserModel.fromMap(userData);
  //   }
  //   return null;
  // }

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
