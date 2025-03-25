import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imen_moj/features/auth/presentation/screens/login_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  static const String routName ='/UserScreen';

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
    return Scaffold(
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
            onPressed: () async {
              await getAllUsers();
              // await FirebaseAuth.instance.signOut();
            },
            child: Text('getUsers'),
          ),
        ],
      ),
    );
  }

  Future<void> getAllUsers() async {
    DatabaseEvent event = await _dbRef.child("user").once();
    Map<dynamic, dynamic>? usersMap = event.snapshot.value as Map<dynamic, dynamic>?;
    log(usersMap.toString());
  }
}