import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imen_moj/features/auth/presentation/screens/login_screen.dart';
import 'package:imen_moj/features/user/presentation/user_screen.dart';

import '../features/auth/presentation/screens/register_screen.dart';

class AppRouter {
  GoRouter get router => GoRouter(
        initialLocation: RegisterScreen.routName,
        debugLogDiagnostics: true,
        routes: [
          GoRoute(
              path: RegisterScreen.routName,
              builder: (BuildContext context, GoRouterState state) {
                return const RegisterScreen();
              }),
          GoRoute(
              path: LoginScreen.routName,
              builder: (BuildContext context, GoRouterState state) {
                return const LoginScreen();
              }),
          GoRoute(
              path: UserScreen.routName,
              builder: (BuildContext context, GoRouterState state) {
                return const UserScreen();
              }),
        ],
      );
}
