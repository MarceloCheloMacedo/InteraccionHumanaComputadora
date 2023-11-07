import 'package:firebase_auth/firebase_auth.dart';

enum UserType { profesor, alumno }

class User {
  final String uid;
  final String email;
  final String displayName;
  final String photoURL;
  final UserType userType;

  User({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoURL,
    required this.userType,
  });

  factory User.fromFirebaseUser(UserCredential userCredential) {
    final UserCredential firebaseUser = userCredential;
    return User(
      uid: firebaseUser.user!.uid,
      email: firebaseUser.user!.email ?? "",
      displayName: firebaseUser.user!.displayName ?? "",
      photoURL: firebaseUser.user!.photoURL ?? "",
      userType: UserType.alumno, //Revisar Logica UserType
    );
  }
}
