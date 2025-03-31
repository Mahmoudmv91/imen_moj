
import 'package:imen_moj/core/helper/data_state.dart';
import 'package:imen_moj/core/use_cases/use_case.dart';
import 'package:imen_moj/features/user/domain/repositories/user_repository.dart';

class AllUsersUseCase extends UseCaseNoParams<DataState>{
  final UserRepository _userRepository;
  AllUsersUseCase(this._userRepository);

  @override
  Future<DataState> call() {
    return _userRepository.getAllUsers();
  }
}