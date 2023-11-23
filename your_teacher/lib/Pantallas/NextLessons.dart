// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_teacher/AccesoDatos/Manage_Context.dart';
import 'package:your_teacher/Dominios/Lesson.dart';
import 'package:your_teacher/Logica/flutterMethods.dart';
import 'package:your_teacher/Pantallas/find_class.dart';
import 'package:your_teacher/Dominios/user.dart';
import 'package:your_teacher/Dominios/Disponibilidad.dart';
import 'package:your_teacher/AccesoDatos/firebase_service.dart' as service;
import 'package:your_teacher/Pantallas/widget/NavDrawerStudentTeacher.dart';
import 'package:your_teacher/Pantallas/widget/calendarScreen.dart';

class NextLessons extends StatelessWidget {
  @override
  const NextLessons({super.key,required this.lessons,});
  
  final List<Lesson> lessons;

  @override
  Widget build(BuildContext context)  {
    String? correo = Provider.of<AppState>(context).usuarioLogeado?.correo;
    return Scaffold(
      drawer: NavDrawerStudentTeacher(),
      backgroundColor: const Color.fromRGBO(247, 225, 180, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(246, 243, 233, 1),
        title: Text(
          'PRÓXIMAS CLASES',
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'NerkoOne',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromRGBO(246, 243, 233, 1),
                  child: ListTile(
                    leading: FlutterLogo(size: 56.0),
                    title: Text(
                      lessons[index].dia +" - "+ lessons[index].hora,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'NerkoOne',
                      ),
                    ),
                    subtitle: Text(
                      lessons[index].link,
                      style: TextStyle(
                        fontSize: 19.0,
                        fontFamily: 'NerkoOne',
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
