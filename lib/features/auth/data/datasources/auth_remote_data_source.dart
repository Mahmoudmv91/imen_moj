import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:imen_moj/features/auth/data/models/user_model.dart';
import 'package:imen_moj/features/auth/data/params/login_params.dart';

import '../../../../core/helper/error_helper.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  Future<dynamic> login(LoginParams params) async {
    try {
      UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(
            email: params.email,
            password: params.password,
          )
          .timeout(const Duration(seconds: 5));
      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;
        DatabaseEvent event = await _dbRef.child("users").child(uid).once();
        final data = event.snapshot.value;
        if (data != null && data is Map) {
          Map<String, dynamic> userData = Map<String, dynamic>.from(data);
          return UserModel.fromMap(userData);
        } else {
          return null;
        }
      }
      return null;
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

  Future<void> logout() async {
    await _auth.signOut();
  }
}
