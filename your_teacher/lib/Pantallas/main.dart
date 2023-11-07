import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
<<<<<<< HEAD:your_teacher/lib/main.dart
import 'package:your_teacher/find_Class.dart';
import 'package:your_teacher/login.dart';

import 'firebase_options.dart';
=======
import 'package:your_teacher/Pantallas/login.dart';
import '../AccesoDatos/firebase_options.dart';
>>>>>>> e3f5b2573f4ab1ed72a3eb6a50a4bc593c7d46ac:your_teacher/lib/Pantallas/main.dart


void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Asegura la inicialización de WidgetsFlutterBinding
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Initialize Firebase with the DefaultFirebaseOptions
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
      theme: ThemeData(colorSchemeSeed:  Color.fromARGB(255, 62, 103, 215), useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'Buscar Clase',      
      home: MyFind_Class(),
      
    );
  }
}
