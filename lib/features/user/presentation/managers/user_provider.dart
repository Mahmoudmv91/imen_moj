import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:imen_moj/core/helper/data_state.dart';
import 'package:imen_moj/core/helper/locator.dart';
import 'package:imen_moj/core/utils/loading_provider.dart';
import 'package:imen_moj/features/auth/data/models/user_model.dart';
import 'package:imen_moj/features/user/domain/use_cases/all_users_use_case.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> _userList = [];

  List<UserModel> get userList => _userList;

  Future<void> getAllUsers(BuildContext context) async {
    final loading = context.read<LoadingProvider>();
    loading.showLoading();
    AllUsersUseCase request = locator();
    var response = await request();
    loading.hideLoading();
    if (response is DataSuccess) {
      _userList = response.data;
    }
    if (response is DataFailed) {
      log(response.errorMessage.toString());
      _userList = [];
    }
    notifyListeners();
  }

  Future<void> deleteUser() async {
    ///TODO:deleteUser method
  }

  Future<void> updateUser() async {
    ///TODO:updateUser method
  }
}
