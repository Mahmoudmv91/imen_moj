import 'package:flutter/material.dart';
import 'package:imen_moj/core/helper/data_state.dart';
import 'package:imen_moj/features/auth/data/models/user_model.dart';
import 'package:imen_moj/features/user/data/data_sources/user_remote_data_source.dart';
import 'package:imen_moj/features/user/data/params/user_params.dart';

import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl(this._userRemoteDataSource);

  @override
  Future<DataState> deleteUser(UserParams params) {
    return Future.value(DataSuccess(data: 'data'));
    // return _userRemoteDataSource.delete(params);
  }

  @override
  Future<DataState> getAllUsers() async {
    try {
      var response = await _userRemoteDataSource.getAllUsers();
      if (response != null && response.isNotEmpty) {
        List<UserModel> userList = response.entries.map<UserModel>((e){
          return UserModel.fromMap(Map<String,dynamic>.from(e.value));
        }).toList();

        return DataSuccess(data: userList);
      } else {
        return DataFailed(errorMessage: 'خطا در دریافت اطلاعات');
      }
    } catch (e) {
      return DataFailed(errorMessage: e.toString());
    }
  }

  @override
  Future<DataState> readUser(UserParams params) async {
    try {
      var response = await _userRemoteDataSource.currentUser(params.uid);
      if (response != null) {
        return DataSuccess(data: response);
      } else {
        return DataFailed(errorMessage: 'خطا در دریافت اطلاعات');
      }
    } catch (e) {
      return DataFailed(errorMessage: e.toString());
    }
  }

  @override
  Future<DataState> updateUser(UserParams params) async{
    try {
      var response = await _userRemoteDataSource.updateUser(params.uid,params.toMap());
      if (response != null) {
        return DataSuccess(data: response);
      } else {
        return DataFailed(errorMessage: 'خطا در دریافت اطلاعات');
      }
    } catch (e) {
      return DataFailed(errorMessage: e.toString());
    }
  }
}
