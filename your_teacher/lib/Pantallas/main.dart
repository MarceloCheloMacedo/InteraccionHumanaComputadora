import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:your_teacher/Dominios/Disponibilidad.dart';
import '../AccesoDatos/Manage_Context.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:your_teacher/Pantallas/Available_Teacher.dart';
import 'package:your_teacher/Pantallas/Available_Lessons.dart';

import 'package:your_teacher/Pantallas/find_class.dart';

import 'package:your_teacher/Pantallas/login.dart';
import '../AccesoDatos/firebase_options.dart';
import '../AccesoDatos/firebase_service.dart';
import '../Dominios/User.dart';

import 'package:your_teacher/Pantallas/homePage.dart';
import 'package:your_teacher/Pantallas/register.dart';
import 'package:your_teacher/AccesoDatos/firebase_options.dart';
import 'package:your_teacher/Pantallas/widget/MyTimeRange.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Asegura la inicialización de WidgetsFlutterBinding

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Initialize Firebase with the DefaultFirebaseOptions
  Disponibilidad dispo = Disponibilidad(
    correo: 'marcelo5411a@hotmail.com',
    domingo: '18:00',
    lunes: '18:00',
    martes: '18:00',
    miercoles: '19:00',
    jueves: '18:00',
    viernes: '18:00',
    sabado: '18:00',
  );

  insertDisponibilidad(dispo);

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MyApp(),
    ),
  );
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
      home: MyFind_Class(),
    );
  }
}
