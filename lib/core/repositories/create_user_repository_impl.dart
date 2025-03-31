import 'package:imen_moj/core/data/datasources/create_user_remote_data_source.dart';
import 'package:imen_moj/core/repositories/create_user_repository.dart';
import 'package:imen_moj/features/auth/data/models/user_model.dart';

import '../helper/data_state.dart';
import '../params/create_user_params.dart';

class CreateUserRepositoryImpl implements CreateUserRepository {
  final CreateUserDataSource remoteDataSource;

  CreateUserRepositoryImpl(this.remoteDataSource);

  @override
  Future<DataState> createUser(CreateUserParams params) async {
    try {
      var response = await remoteDataSource.createUser(params);
      if (response is UserModel) {
        return DataSuccess(data: response);
      } else {
        return DataFailed(errorMessage: 'خطا در ارتباط با سرور');
      }
    } catch (e) {
      return DataFailed(errorMessage: e.toString());
    }
  }
}
