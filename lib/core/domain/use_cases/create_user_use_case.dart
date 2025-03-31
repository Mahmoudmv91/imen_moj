import 'package:imen_moj/core/helper/data_state.dart';
import 'package:imen_moj/core/params/create_user_params.dart';
import 'package:imen_moj/core/repositories/create_user_repository.dart';
import 'package:imen_moj/core/use_cases/use_case.dart';

class CreateUserUseCase implements UseCase<DataState, CreateUserParams> {
  final CreateUserRepository createUserRepository;

  CreateUserUseCase(this.createUserRepository);

  @override
  Future<DataState> call(CreateUserParams params) async {
    return createUserRepository.createUser(params);
  }
}
