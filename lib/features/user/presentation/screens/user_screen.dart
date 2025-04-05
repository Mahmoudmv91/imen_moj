import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:imen_moj/config/theme/colors.dart';
import 'package:imen_moj/features/auth/data/models/user_model.dart';
import 'package:imen_moj/features/auth/presentation/screens/login_screen.dart';
import 'package:imen_moj/features/user/presentation/managers/user_provider.dart';
import 'package:imen_moj/features/user/presentation/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

import '../../../../core/const/assets_utils.dart';
import '../../../../core/helper/theme_provider.dart';
import '../widgets/users_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  static const String routName = '/UserScreen';

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        if (mounted) {
          context.pushReplacement(LoginScreen.routName);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = GoRouterState.of(context).extra as UserModel;
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Consumer<ThemeProvider>(
                builder: (_, provider, __) {
                  return provider.selectedThemeMode == ThemeMode.light
                      ? ExtendedImage.asset(
                          ImageAssets.img_bg_pattern,
                          fit: BoxFit.fill,
                        )
                      : Container(
                          color: AColors.background,
                        );
                },
              ),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap:(){
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            child: SvgPicture.asset(
                              SvgAssets.ic_user_menu,
                              width: 30,
                            ),
                          ),
                          Text('لیست کاربران', style: Theme.of(context).textTheme.bodyMedium),
                          Consumer<UserProvider>(
                            builder: (context, provider, child) {
                              return Text(provider.userList.length.toString() + ' نفر', style: Theme.of(context).textTheme.bodyMedium);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const UsersWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: DrawerWidget(data: user),
      ),
    );
  }
}
