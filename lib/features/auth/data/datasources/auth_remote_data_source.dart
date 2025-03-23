import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:imen_moj/features/auth/data/models/user_model.dart';
import 'package:imen_moj/features/auth/data/params/login_params.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  Future<UserModel?> register(String name, String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user != null) {
      String uid = userCredential.user!.uid;
      UserModel user = UserModel(uid: uid, name: name, email: email);
      await _dbRef.child("users").child(uid).set(user.toMap());
      return user;
    }
    return null;
  }

  Future<dynamic> login(LoginParams params) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    if (userCredential.user != null) {
      String uid = userCredential.user!.uid;
      DatabaseEvent event = await _dbRef.child("user").child(uid).once();
      Map userData = event.snapshot.value as Map<dynamic, dynamic>;
      userData.addAll({'uid':uid});
      return userData;
      // return UserModel.fromMap(userData, uid);
    }
    return null;
  }

  // Future<dynamic> getUsers() async {
  //   if (userCredential.user != null) {
  //     String uid = userCredential.user!.uid;
  //     _dbRef.child("user").
  //     DatabaseEvent event = await _dbRef.child("user").child(uid).once();
  //     Map userData = event.snapshot.value as Map<dynamic, dynamic>;
  //     userData.addAll({'uid':uid});
  //     return userData;
  //     // return UserModel.fromMap(userData, uid);
  //   }
  //   return null;
  // }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<UserModel?> getCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DatabaseEvent event = await _dbRef.child("user").child(user.uid).once();
      Map<dynamic, dynamic> userData = event.snapshot.value as Map<dynamic, dynamic>;
      userData.addAll({'uid':user.uid});
      return UserModel.fromMap(userData);
    }
    return null;
  }
}
