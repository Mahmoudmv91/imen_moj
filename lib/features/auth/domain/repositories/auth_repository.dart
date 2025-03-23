
import 'package:imen_moj/core/helper/data_state.dart';
import 'package:imen_moj/features/auth/domain/entities/user_entity.dart';

import '../../data/params/login_params.dart';

abstract class AuthRepository{

  Future<DataState> register(String name,String email,String password);
  Future<DataState> login(LoginParams params);
  Future<void> logout();
  Future<UserEntity?> getCurrentUser();
}