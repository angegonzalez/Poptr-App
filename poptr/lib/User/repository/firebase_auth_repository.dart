

import 'package:firebase_auth/firebase_auth.dart';
import 'package:poptr/User/repository/firebase_auth_api.dart';

class AuthRepository{
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<FirebaseUser> signIn(String email, String password) => _firebaseAuthAPI.signIn(email, password);
  void signOut () => _firebaseAuthAPI.signOut();

}