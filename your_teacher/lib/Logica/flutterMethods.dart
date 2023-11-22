import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:your_teacher/AccesoDatos/firebase_service.dart';
import '../Errores/authentication_errors.dart';
import '../AccesoDatos/firebase_service.dart' as a;
import '../Dominios/Disponibilidad.dart';
import '../Dominios/user.dart';


class FirebaseAuthHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null; // El usuario canceló el inicio de sesión con Google.
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      return authResult.user;
    } catch (e) {
      print("Error en inicio de sesión con Google: $e");
      return null;
    }
  }

  Future<User?> signUpWithEmailAndPassword(String email, String password,
      BuildContext context, UserD userNew) async {
    try {
      final UserCredential authResult =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      insertUser(userNew);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registro exitoso'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      return authResult.user;
    } catch (e) {
      ErrorMessages.showAuthenticationErrorDialog(context, e);
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user;
    } catch (e) {
      ErrorMessages.showAuthenticationErrorDialog(context, e);
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<List<UserD>> getUsersWithAvailability(String dia) async {
    return await getUsersWithAvailability(dia);
  }

  Future<void> insertDisponibilidades(Disponibilidad disponibilidad) async {
    return await insertDisponibilidad(disponibilidad);
  }

  Future<bool> existeDisponibilidad(String correo) async {
    return await existeDisponibilidad(correo);
  }

  Future<List<Disponibilidad>> getDisponibilidades() async {
    return await getDisponibilidades();
  }

  Future<List<UserD>> getAllTeachers() async {
    return await getAllTeachers();
  }

  Future<Disponibilidad> getDisponibilidadByCorreos(String correo) async {
    final Disponibilidad = await getDisponibilidadByCorreo(correo);
    return Disponibilidad;
  }
}
