import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imen_moj/core/helper/data_state.dart';
import 'package:imen_moj/core/helper/locator.dart';
import 'package:imen_moj/features/auth/data/params/login_params.dart';
import 'package:imen_moj/features/auth/domain/entities/user_entity.dart';
import 'package:imen_moj/features/auth/domain/use_cases/login_use_case.dart';
import 'package:imen_moj/features/auth/domain/use_cases/validate_use_case.dart';
import 'package:imen_moj/features/user/presentation/user_screen.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? errorMessage;

  UserEntity? _user;

  UserEntity? get user => _user;

  String? validateEmail(String email) {
    return ValidateUseCase.validateEmail(email);
  }

  String? validatePassword(String password) {
    return ValidateUseCase.validatePassword(password);
  }

  Future<void> login(BuildContext context) async {
    LoginParams params = LoginParams(
      email: emailController.text,
      password: passwordController.text,
    );
    LoginUseCase request = locator();
    var response = await request(params);
    if (response is DataSuccess) {
      _user = response.data;
      if (context.mounted) {
        context.push(UserScreen.routName);
        errorMessage = null;
      }
    }
    if (response is DataFailed) {
      _user = null;
      errorMessage = response.errorMessage;
      log(response.errorMessage.toString());
    }
    notifyListeners();
  }
}
