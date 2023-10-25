import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String uid;
  final String email;
  final String displayName;
  final String photoURL;

  User({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoURL,
  });

  factory User.fromFirebaseUser(UserCredential userCredential) {
    final UserCredential firebaseUser = userCredential;
    return User(
      uid: firebaseUser.user!.uid,
      email: firebaseUser.user!.email ?? "",
      displayName: firebaseUser.user!.displayName ?? "",
      photoURL: firebaseUser.user!.photoURL ?? "",
    );
  }
}
