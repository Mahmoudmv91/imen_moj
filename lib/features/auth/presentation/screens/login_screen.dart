import 'dart:convert';
import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imen_moj/core/util/utils.dart';
import 'package:imen_moj/features/auth/presentation/manager/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? avatar;

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
                  context.read<LoginProvider>().login();
                },
                child: Text('Login'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final data = await ImageUtil().takeImage(ImageSource.gallery);
                  avatar = data;
                  log(data.toString());
                },
                child: Text('Image'),
              ),
              if (avatar != null)
                CircleAvatar(
                  child: ExtendedImage.memory(const Base64Codec().decode(avatar!)),
                ),
              Consumer<LoginProvider>(
                builder: (_, provider, __) {
                  return Text('${provider.user?.uid} +  ${provider.user?.name}  +  ${provider.user?.email}');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
