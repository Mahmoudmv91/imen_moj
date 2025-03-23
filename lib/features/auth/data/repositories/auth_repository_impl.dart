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
  Future<UserEntity?> getCurrentUser() {
    return remoteDataSource.getCurrentUser();
  }

  @override
  Future<DataState> login(LoginParams params) async{
    var data =await remoteDataSource.login(params);
    if(data !=null){
      UserEntity userEntity = UserModel.fromMap(data as Map<dynamic, dynamic>);
      return DataSuccess<UserEntity>(data: userEntity);
    }else{
      return DataFailed(errorMessage: 'User Not Found');
    }
  }

  @override
  Future<void> logout() {
    return remoteDataSource.logout();
  }

  @override
  Future<DataState> register(String name, String email, String password)async {
    return await Future.value(DataFailed(errorMessage: ''));
    // return remoteDataSource.register(name, email, password);
  }
}
