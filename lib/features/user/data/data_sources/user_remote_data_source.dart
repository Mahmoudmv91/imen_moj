import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:imen_moj/features/user/data/params/user_params.dart';

import '../../../../core/helper/error_helper.dart';

class UserRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  Future<dynamic> getAllUsers() async {
    if (_auth.currentUser != null) {
      DatabaseEvent event = await _dbRef.child("users").once();
      Map<dynamic, dynamic>? userData = event.snapshot.value as Map<dynamic, dynamic>?;
      if (userData == null) return [];
      return userData;
    }
    return null;
  }

  Future<dynamic> deleteUser(UserParams params) async {
    try {
      // User? user = _auth.currentUser;
      // if (user != null) {
      //   await user.delete().timeout(
      //         const Duration(seconds: 5),
      //       );
      // }
      DatabaseReference userRef = FirebaseDatabase.instance.ref("users/${params.uid}");
      await userRef.remove();
      return true;
    } on TimeoutException catch (e) {
      log("TimeoutException: ${e.message}");
      throw 'خطا در ارتباط با سرور،لطفا مجدد تلاش نمایید';
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.message}");
      throw handleFirebaseAuthException(e);
    } catch (e, stackTrace) {
      log("Unexpected error during login: $e", stackTrace: stackTrace);
      throw "خطای غیر منتظره ای رخ داد. لطفا دوباره تلاش نمایید";
    }
  }

  Future<dynamic> updateUser(String uid, Map<String, dynamic> updateData) async {
    try {
      DatabaseReference userRef = FirebaseDatabase.instance.ref("users/${uid}");
      await userRef.update(updateData);
      return true;
    } on TimeoutException catch (e) {
      log("TimeoutException: ${e.message}");
      throw 'خطا در ارتباط با سرور،لطفا مجدد تلاش نمایید';
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.message}");
      throw handleFirebaseAuthException(e);
    } catch (e, stackTrace) {
      log("Unexpected error during login: $e", stackTrace: stackTrace);
      throw "خطای غیر منتظره ای رخ داد. لطفا دوباره تلاش نمایید";
    }
  }

  Future<dynamic> currentUser(String uid) async {
    try {
      DatabaseReference userRef = FirebaseDatabase.instance.ref("users/${uid}");
      DataSnapshot snapshot = await userRef.get();
      if (snapshot.exists) {
        return Map<String, dynamic>.from(snapshot.value as Map<String, dynamic>);
      } else {
        return null;
      }
    } on TimeoutException catch (e) {
      log("TimeoutException: ${e.message}");
      throw 'خطا در ارتباط با سرور،لطفا مجدد تلاش نمایید';
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.message}");
      throw handleFirebaseAuthException(e);
    } catch (e, stackTrace) {
      log("Unexpected error during login: $e", stackTrace: stackTrace);
      throw "خطای غیر منتظره ای رخ داد. لطفا دوباره تلاش نمایید";
    }
  }
}
