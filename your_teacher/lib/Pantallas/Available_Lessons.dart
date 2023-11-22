import 'package:flutter/material.dart';
import 'package:your_teacher/Pantallas/find_class.dart';
import 'package:your_teacher/Dominios/user.dart';
import 'package:your_teacher/Dominios/Disponibilidad.dart';
import 'package:your_teacher/AccesoDatos/firebase_service.dart' as service;
import 'package:your_teacher/Pantallas/widget/NavDrawerStudentTeacher.dart';
import 'package:your_teacher/Pantallas/widget/calendarScreen.dart';

class AvailableLessons extends StatelessWidget {
  const AvailableLessons({
    super.key,
    required this.teachersFilter,
    required this.daySelected,
  });
  final List<UserD> teachersFilter;
  final String? daySelected;

  @override
  Widget build(BuildContext context) {
    Disponibilidad? dispo;
    return Scaffold(
      drawer: NavDrawerStudentTeacher(),
      backgroundColor: const Color.fromRGBO(247, 225, 180, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(246, 243, 233, 1),
        title: Text(
          'CLASES DISPONIBLES',
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
              itemCount: teachersFilter.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromRGBO(246, 243, 233, 1),
                  child: ListTile(
                    leading: FlutterLogo(size: 56.0),
                    title: Text(
                      teachersFilter[index].nombre,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'NerkoOne',
                      ),
                    ),
                    subtitle: Text(
                      teachersFilter[index].correo,
                      style: TextStyle(
                        fontSize: 19.0,
                        fontFamily: 'NerkoOne',
                      ),
                    ),
                    trailing: Icon(
                      Icons.check_rounded,
                      size: 35.0,
                      color: Colors.green[700],
                    ),
                    onTap: () async => {
                      dispo = await service.getDisponibilidadByCorreo(
                          teachersFilter[index].correo),
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalendarScreen(
                            userSelected: teachersFilter[index],
                            disponibilidad: dispo,
                            daySelected: daySelected,
                          ),
                        ),
                      )
                    },
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
