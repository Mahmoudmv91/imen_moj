import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imen_moj/config/theme/colors.dart';
import 'package:imen_moj/core/widgets/custom_fade_in_image.dart';
import 'package:imen_moj/features/auth/data/models/user_model.dart';
import 'package:imen_moj/features/auth/presentation/screens/login_screen.dart';
import 'package:imen_moj/features/user/presentation/managers/user_provider.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  static const String routName = '/UserScreen';

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

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
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('welcome'),
            ),
            ElevatedButton(
              onPressed: () async {
                // await getAllUsers();
                await FirebaseAuth.instance.signOut();
              },
              child: Text('signOut'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<UserProvider>().getAllUsers(context);
              },
              child: Text('getUsers'),
            ),
            Consumer<UserProvider>(
              builder: (_, provider, __) {
                return FutureBuilder<List<UserModel>>(
                  future: provider.getAllUsers(context),
                  builder: (context,snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          itemCount: provider.userList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item = provider.userList[index];
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: AColors.containerBorderColor),
                                borderRadius: BorderRadius.circular(7.5),
                              ),
                              child: Row(
                                children: [
                                  CustomImageFadeWidget(
                                    imagesURL: item.avatar ?? '',
                                    isBase64: true,
                                    boxFit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                    if(snapshot.hasError){
                      return Center(
                                  child: Text('دیتایی برای نمایش وجود ندارد'),
                                );
                    }
                    return const CircularProgressIndicator();
                  },
                );
                // return provider.userList.isNotEmpty
                //     ?
                //     : Center(
                //         child: Text('دیتایی برای نمایش وجود ندارد'),
                //       );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getAllUsers() async {
    DatabaseEvent event = await _dbRef.child("users").once();
    Map<dynamic, dynamic>? usersMap = event.snapshot.value as Map<dynamic, dynamic>?;
    log(usersMap.toString());
  }
}
