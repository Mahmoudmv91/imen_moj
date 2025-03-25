

import 'package:flutter/material.dart';
import 'package:imen_moj/features/auth/presentation/manager/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routName = '/LoginScreen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (_) => LoginProvider(),
      builder: (context, child) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 25,
            children: [
              TextField(
                controller: context.read<LoginProvider>().emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: context.read<LoginProvider>().passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<LoginProvider>().login(context);
                },
                child: Text('Login'),
              ),

              Consumer<LoginProvider>(
                builder: (_, provider, __) {
                  return Column(
                    children: [
                      if (provider.errorMessage != null)
                        Text(
                          provider.errorMessage!,
                          style: TextStyle(color: Colors.red),
                        ),
                      Text('${provider.user?.uid} +  ${provider.user?.name}  +  ${provider.user?.email}'),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
