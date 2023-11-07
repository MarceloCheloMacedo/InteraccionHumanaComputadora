import 'package:firebase_auth/firebase_auth.dart';
import 'package:your_teacher/Dominios/Lesson.dart';

class Cita {
  final String uid;
  final User useTeacher;
  final User userStudent;
  final DateTime date;
  final Lesson lesson;

  Cita({
    required this.uid,
    required this.useTeacher,
    required this.userStudent,
    required this.date,
    required this.lesson,
  });
}
