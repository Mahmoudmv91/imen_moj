import 'package:get_it/get_it.dart';
import 'package:imen_moj/core/data/datasources/create_user_remote_data_source.dart';
import 'package:imen_moj/core/repositories/create_user_repository.dart';
import 'package:imen_moj/core/repositories/create_user_repository_impl.dart';
import 'package:imen_moj/core/domain/use_cases/create_user_use_case.dart';
import 'package:imen_moj/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:imen_moj/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:imen_moj/features/auth/domain/repositories/auth_repository.dart';
import 'package:imen_moj/features/auth/domain/use_cases/login_use_case.dart';
import 'package:imen_moj/features/user/data/data_sources/user_remote_data_source.dart';
import 'package:imen_moj/features/user/domain/repositories/user_repository.dart';
import 'package:imen_moj/features/user/domain/use_cases/all_users_use_case.dart';

import '../../features/user/data/repositories/user_repository_impl.dart';

final GetIt locator = GetIt.I;

Future<void> setup() async {
  /// DataSources
  locator.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSource());
  locator.registerSingleton<CreateUserDataSource>(CreateUserDataSource());
  locator.registerSingleton<UserRemoteDataSource>(UserRemoteDataSource());

  ///Repositories
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));
  locator.registerSingleton<CreateUserRepository>(CreateUserRepositoryImpl(locator()));
  locator.registerSingleton<UserRepository>(UserRepositoryImpl(locator()));

  ///UseCases
  locator.registerSingleton<LoginUseCase>(LoginUseCase(locator()));
  locator.registerSingleton<CreateUserUseCase>(CreateUserUseCase(locator()));
  locator.registerSingleton<AllUsersUseCase>(AllUsersUseCase(locator()));
}
