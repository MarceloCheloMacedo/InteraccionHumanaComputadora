import 'package:firebase_auth/firebase_auth.dart';
import 'package:your_teacher/Dominios/Comment.dart';

class Lesson {
  final String? uid;
  final String correo;
  final String dia;
  final String hora;
  final String link;

  Lesson({
    this.uid,
    required this.correo,
    required this.dia,
    required this.hora,
    required this.link,
  });
}
