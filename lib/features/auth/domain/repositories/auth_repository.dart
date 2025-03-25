
import 'package:imen_moj/core/helper/data_state.dart';

import '../../data/params/login_params.dart';
import '../../data/params/register_params.dart';

abstract class AuthRepository{

  Future<DataState> register(RegisterParams params);
  Future<DataState> login(LoginParams params);
  Future<void> logout();
  // Future<UserEntity?> getCurrentUser();
}