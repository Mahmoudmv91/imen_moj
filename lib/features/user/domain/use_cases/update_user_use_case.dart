import 'package:imen_moj/core/helper/data_state.dart';
import 'package:imen_moj/core/use_cases/use_case.dart';
import 'package:imen_moj/features/user/data/params/user_params.dart';
import 'package:imen_moj/features/user/domain/repositories/user_repository.dart';

class UpdateUserUseCase extends UseCase<DataState, UserParams> {
  final UserRepository _userRepository;

  UpdateUserUseCase(this._userRepository);

  @override
  Future<DataState> call(UserParams params) {
    return _userRepository.updateUser(params);
  }
}
