import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:your_teacher/Pantallas/Available_Teacher.dart';
import 'package:your_teacher/Pantallas/homePage.dart';
import 'package:your_teacher/AccesoDatos/firebase_options.dart';
import 'package:your_teacher/Pantallas/widget/MyTimeRange.dart';


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
      localizationsDelegates: [
         GlobalMaterialLocalizations.delegate
       ],
       supportedLocales: [
         const Locale('es'),
         const Locale('en')
       ],
      theme: ThemeData(colorSchemeSeed:  Color.fromARGB(255, 62, 103, 215), useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'Home',      
      home:Available_Teacher(),
      
    );
  }
}
