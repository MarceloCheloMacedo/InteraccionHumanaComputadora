import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:your_teacher/Pantallas/Available_Teacher.dart';

import 'package:your_teacher/Pantallas/login.dart';
import '../AccesoDatos/firebase_options.dart';
import '../AccesoDatos/firebase_service.dart';
import '../Dominios/User.dart';

import 'package:your_teacher/Pantallas/homePage.dart';
import 'package:your_teacher/AccesoDatos/firebase_options.dart';
import 'package:your_teacher/Pantallas/widget/MyTimeRange.dart';

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
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: Color.fromARGB(255, 62, 103, 215),
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'Home',
      home: MyHomePage(),
    );
  }
}
