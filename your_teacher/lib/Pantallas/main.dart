import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:your_teacher/Pantallas/menu.dart';
import 'package:your_teacher/Pantallas/login.dart';
import '../AccesoDatos/firebase_options.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'menu',
      home: MyMenu(),
    );
  }
}
