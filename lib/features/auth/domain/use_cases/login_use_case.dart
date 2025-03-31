import 'package:imen_moj/core/helper/data_state.dart';
import 'package:imen_moj/core/use_cases/use_case.dart';
import 'package:imen_moj/features/auth/domain/repositories/auth_repository.dart';

import '../../data/params/login_params.dart';

class LoginUseCase extends UseCase<DataState, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<DataState> call(LoginParams params) {
    return authRepository.login(params);
  }
}
