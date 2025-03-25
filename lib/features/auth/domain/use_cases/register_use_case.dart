

import 'package:imen_moj/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/helper/data_state.dart';
import '../../../../core/helper/use_case.dart';
import '../../data/params/register_params.dart';

class RegisterUseCase extends UseCase<DataState,RegisterParams>{
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  @override
  Future<DataState> call(RegisterParams params) {
    return authRepository.register(params);
  }
}