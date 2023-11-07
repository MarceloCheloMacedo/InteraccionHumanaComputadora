import 'package:firebase_auth/firebase_auth.dart';
import 'package:your_teacher/Dominios/Comment.dart';

class Lesson {
  final String uid;
  final User useTeacher;
  final String description;
  final List<Comment> comment;

  Lesson({
    required this.uid,
    required this.useTeacher,
    required this.comment,
    required this.description,
  });
}
