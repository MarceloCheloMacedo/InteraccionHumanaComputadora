import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_teacher/AccesoDatos/Manage_Context.dart';
import 'package:your_teacher/Pantallas/widget/NavDrawerStudent.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtiene el correo del usuario del Provider
    String? correo = Provider.of<AppState>(context).usuarioLogeado?.correo;

    return Scaffold(
      drawer: NavDrawerStudent(),
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text(correo ??
            'Usuario Desconocido'), // Mostrar el correo o un mensaje si es nulo
      ),
    );
  }
}
