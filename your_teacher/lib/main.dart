import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:your_teacher/Pantallas/homePage.dart';
import 'package:your_teacher/AccesoDatos/firebase_options.dart';


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
      home: MyHomePage(),
      
    );
  }
}
