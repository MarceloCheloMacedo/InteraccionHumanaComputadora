//enum UserType { profesor, alumno }

class UserD {
  final String? uid;
  final String correo;
  final String nombre;
  final String apellido;
  final String foto;
  final String tipo;
  final String pais;
  final DateTime fechaNacimiento;

  UserD({
    this.uid,
    required this.correo,
    required this.nombre,
    required this.apellido,
    required this.foto,
    required this.tipo,
    required this.pais,
    required this.fechaNacimiento,
  });

  /*factory User.fromFirebaseUser(UserCredential userCredential) {
    final UserCredential firebaseUser = userCredential;
    return User(
      uid: firebaseUser.user!.uid,
      email: firebaseUser.user!.email ?? "",
      displayName: firebaseUser.user!.displayName ?? "",
      photoURL: firebaseUser.user!.photoURL ?? "",
      userType: UserType.alumno, //Revisar Logica UserType
    );
  }*/
}
