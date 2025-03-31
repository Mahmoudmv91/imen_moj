import 'package:imen_moj/core/helper/data_state.dart';

import '../../data/params/user_params.dart';

abstract class UserRepository{

  Future<DataState> getAllUsers();
  Future<DataState> updateUser(UserParams params);
  Future<DataState> deleteUser(UserParams params);
  Future<DataState> readUser(UserParams params);
}