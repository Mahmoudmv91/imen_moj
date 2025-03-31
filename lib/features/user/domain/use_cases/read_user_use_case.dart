import '../../../../core/helper/data_state.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../../../features/user/data/params/user_params.dart';
import '../../../../features/user/domain/repositories/user_repository.dart';

class ReadUserUseCase extends UseCase<DataState, UserParams> {
  final UserRepository _userRepository;

  ReadUserUseCase(this._userRepository);

  @override
  Future<DataState> call(UserParams params) {
    return _userRepository.readUser(params);
  }
}
