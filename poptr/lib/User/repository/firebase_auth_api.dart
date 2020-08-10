import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> signIn(String email, String password) async {
    String errorMessage = '';
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = authResult.user;
      return user;
    } catch (e) {
      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
          errorMessage = "El email ingresado tiene un formato inadecuado 🤔";
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Tu contraseña es incorrecta 🗝";
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "No existe un usuario con este email 📧";
          break;
        case "ERROR_USER_DISABLED":
          errorMessage = "Este usuario ha sido deshabilitado 💻";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          errorMessage =
              "Demasiados intentos al ingresar. Espera un momento 💥";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Operación no permitida ⛔";
          break;
        default:
          errorMessage = "Ha ocurrido un error inesperado ❌";
      }
    }

    if (errorMessage != ' ') {
      return Future.error(errorMessage);
    }
  }

  void signOut() async {
    await _auth
        .signOut()
        .then((value) => print('La sesión ha sido finalizada correctamente'));
  }

  Future<FirebaseUser> getCurrentUser() async {
    return _auth.currentUser();
  }
}
