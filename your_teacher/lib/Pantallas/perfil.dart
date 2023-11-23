import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:your_teacher/AccesoDatos/Manage_Context.dart';
import 'package:your_teacher/Dominios/user.dart';
import 'package:your_teacher/Pantallas/widget/NavDrawerStudentTeacher.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserD user = Provider.of<AppState>(context).usuarioLogeado!;

    String base64String = user.foto;

    if (base64String.isNotEmpty) {
      List<String> parts = base64String.split(',');

      if (parts.length > 1) {
        Uint8List imageBytes = base64Decode(parts[1]);

        MemoryImage memoryImage = MemoryImage(imageBytes);

        String fechaNacimiento =
            DateFormat('yyyy-MM-dd').format(user.fechaNacimiento);

        return Scaffold(
          appBar: AppBar(
            title: Text('Perfil de Usuario'),
          ),
          drawer: NavDrawerStudentTeacher(),
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Tipo: ${user.tipo}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: memoryImage,
                ),
                SizedBox(height: 16),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          '${user.nombre} ${user.apellido}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Correo: ${user.correo}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'País: ${user.pais}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Fecha de Nacimiento: $fechaNacimiento',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuario'),
      ),
      drawer: NavDrawerStudentTeacher(),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              ' ${user.tipo}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/no_foto.jpg'),
            ),
            SizedBox(height: 16),
            Card(
              color: Colors.lightBlueAccent,
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      '${user.nombre} ${user.apellido}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Correo: ${user.correo}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'País: ${user.pais}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Fecha de Nacimiento: ${user.fechaNacimiento.day}/${user.fechaNacimiento.month}/${user.fechaNacimiento.year}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
