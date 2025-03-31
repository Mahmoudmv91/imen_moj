import 'package:imen_moj/core/helper/data_state.dart';

import '../params/create_user_params.dart';

abstract class CreateUserRepository{
  Future<DataState> createUser(CreateUserParams params);
}