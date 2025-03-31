
import 'package:imen_moj/core/helper/data_state.dart';

import '../../data/params/login_params.dart';


abstract class AuthRepository{
  Future<DataState> login(LoginParams params);
  Future<void> logout();
}