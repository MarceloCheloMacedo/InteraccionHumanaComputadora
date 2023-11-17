import 'package:flutter/material.dart';
import '../Dominios/User.dart';
import 'package:your_teacher/AccesoDatos/firebase_service.dart';

class AppState extends ChangeNotifier {
  User? usuarioLogeado;

  void setUsuarioLogeado(String usuario) async {
    usuarioLogeado = await getUserByEmail(usuario);
    String nameUser = usuarioLogeado?.correo ?? "Usuario Desconocido";
    print('Usuario logeado guardado en context con email: $nameUser');
    notifyListeners();
  }
}