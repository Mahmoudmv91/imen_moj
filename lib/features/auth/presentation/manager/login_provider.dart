import 'package:flutter/material.dart';
import 'package:imen_moj/core/helper/data_state.dart';
import 'package:imen_moj/core/helper/locator.dart';
import 'package:imen_moj/features/auth/data/params/login_params.dart';
import 'package:imen_moj/features/auth/domain/entities/user_entity.dart';
import 'package:imen_moj/features/auth/domain/use_cases/login_use_case.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  UserEntity? _user;

  UserEntity? get user => _user;

  // Future<void> register(String name, String email, String password) async {
  //   _user = await authRepository.register(name, email, password);
  //   notifyListeners();
  // }

  Future<void> login() async {
    LoginParams params = LoginParams(email: emailController.text, password: passwordController.text);
    LoginUseCase request = locator();
    var response = await request(params);
    if (response is DataSuccess) {
      _user = response.data;
    }
    if (response is DataFailed) {
      _user = null;
    }
    notifyListeners();
  }

// Future<void> logOut() async {
//   await authRepository.logout();
//   _user = null;
//   notifyListeners();
// }
//
// Future<void> loadCurrentUser() async {
//   _user = await authRepository.getCurrentUser();
//   notifyListeners();
// }
}
