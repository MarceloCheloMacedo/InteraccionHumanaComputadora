import 'package:firebase_auth/firebase_auth.dart';

class Comment {
  final String uid;
  final User useWriter;
  final DateTime date;
  final String description;

  Comment({
    required this.uid,
    required this.useWriter,
    required this.date,
    required this.description,
  });
}
