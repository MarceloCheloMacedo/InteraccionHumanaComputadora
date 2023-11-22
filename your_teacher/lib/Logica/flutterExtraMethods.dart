
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import '../Errores/authentication_errors.dart';
import '../AccesoDatos/firebase_service.dart' as a;
import '../Dominios/Disponibilidad.dart';
import '../Dominios/user.dart';


class FirebaseGetHelper {

  Future<List<UserD>> getUsersWithAvailability(String? dia) async {
    return await a.getUsersWithAvailability(dia!);
  }
}
