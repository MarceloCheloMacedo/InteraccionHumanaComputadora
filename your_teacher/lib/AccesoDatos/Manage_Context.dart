import 'package:flutter/material.dart';
import '../Dominios/user.dart';
import 'package:your_teacher/AccesoDatos/firebase_service.dart';

class AppState extends ChangeNotifier {
  UserD? usuarioLogeado;

  void setUsuarioLogeado(String usuario) async {
    usuarioLogeado = await getUserByEmail(usuario);

    notifyListeners();
  }

  void logout() {
    usuarioLogeado = null;
    notifyListeners();
  }
}
