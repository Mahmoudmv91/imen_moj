import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:imen_moj/features/auth/data/params/login_params.dart';

import '../../../../core/helper/error_helper.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;



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
