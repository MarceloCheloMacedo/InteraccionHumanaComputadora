import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ErrorMessages {
  static void showAuthenticationErrorDialog(BuildContext context, dynamic e) {
    String errorMessage = getErrorMessage(e);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error de autenticación'),
            content: Text(errorMessage),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        });
  }

  static String getErrorMessage(dynamic e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'invalid-email':
          return "Correo electronico invalido";
        case 'user-disabled':
          return "Cuenta de usuario deshabilitada, contacta a soporte";
        // Agrega más casos para manejar otros tipos de errores si es necesario
        case 'user-not-found':
          return "Usuario no encontrado";
        // Manejar usuario no encontrado
        case 'wrong-password':
          return "Contraseña incorrecta. Inténtalo de nuevo.";
        // Manejar contraseña incorrecta
        case 'email-already-in-use':
          return "Correo electronico ya en uso.";
        // Manejar correo electrónico en uso
        case 'weak-password':
          return "Contraseña débil. Inténtalo de nuevo.";
        // Manejar contraseña débil
        case 'too-many-requests':
          return "Demasiadas solicitudes. Inténtalo de nuevo.";
        // Manejar demasiadas solicitudes
        case 'operation-not-allowed':
          return "Operacion no permitida.";
        // Manejar operación no permitida
        default:
          return "Error en inicio de sesión con correo y contraseña: ${e.message}";
      }
    }
    return "Error en inicio de sesión con correo y contraseña: $e";
  }
}
