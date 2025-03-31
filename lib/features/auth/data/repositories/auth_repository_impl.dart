import 'package:imen_moj/core/helper/data_state.dart';
import 'package:imen_moj/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:imen_moj/features/auth/data/models/user_model.dart';
import 'package:imen_moj/features/auth/data/params/login_params.dart';
import 'package:imen_moj/features/auth/domain/entities/user_entity.dart';
import 'package:imen_moj/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<DataState> login(LoginParams params) async{
    try {
      var userCredential = await remoteDataSource.login(params);
      if (userCredential.user != null) {
        UserEntity userEntity = UserModel.fromMap(userCredential.user);
        return DataSuccess<UserEntity>(data: userEntity);
      } else {
        return DataFailed(errorMessage: 'User Not Found');
      }
    } catch (e) {
      return DataFailed(errorMessage: e.toString());
    }
  }

  @override
  Future<void> logout() {
    return remoteDataSource.logout();
  }
}
