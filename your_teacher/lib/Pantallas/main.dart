import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:your_teacher/Pantallas/login.dart';
import '../AccesoDatos/firebase_options.dart';
import '../AccesoDatos/firebase_service.dart';
import '../Dominios/User.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Asegura la inicialización de WidgetsFlutterBinding
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Initialize Firebase with the DefaultFirebaseOptions

  // Llamada a la función getPeople
  List<User> people = await getPeople();
  User userInsert = User(
    correo: 'prueba@hotmail.com',
    nombre: 'prueba',
    apellido: 'apellido',
    foto: 'fotofotofoto',
    tipo: 'Teacher',
    pais: 'Uruguay',
  );

  insertUser(userInsert);
  print(people.length);
  print(7);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loggin',
      home: MyLoggin(),
    );
  }
}
