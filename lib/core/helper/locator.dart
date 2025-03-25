import 'package:get_it/get_it.dart';
import 'package:imen_moj/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:imen_moj/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:imen_moj/features/auth/domain/repositories/auth_repository.dart';
import 'package:imen_moj/features/auth/domain/use_cases/login_use_case.dart';
import 'package:imen_moj/features/auth/domain/use_cases/register_use_case.dart';

final GetIt locator = GetIt.I;

Future<void> setup() async {
  locator.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSource());
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));
  locator.registerSingleton<LoginUseCase>(LoginUseCase(locator()));
  locator.registerSingleton<RegisterUseCase>(RegisterUseCase(locator()));
}
