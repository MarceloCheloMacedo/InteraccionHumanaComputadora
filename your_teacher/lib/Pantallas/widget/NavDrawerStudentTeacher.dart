import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_teacher/AccesoDatos/Manage_Context.dart';
import 'package:your_teacher/Dominios/Lesson.dart';
import 'package:your_teacher/Logica/flutterMethods.dart';
import 'package:your_teacher/Pantallas/501NotImplemented.dart';
import 'package:your_teacher/Pantallas/Available_Lessons.dart';
import 'package:your_teacher/Pantallas/Available_Teacher.dart';
import 'package:your_teacher/Pantallas/NextLessons.dart';
import 'package:your_teacher/Pantallas/find_class.dart';
import 'package:your_teacher/Pantallas/help.dart';
import 'package:your_teacher/Pantallas/login.dart';

class NavDrawerStudentTeacher extends StatelessWidget {
  bool isTeacher = false;
  FirebaseAuthHelper helperAuth = new FirebaseAuthHelper();

  @override
  Widget build(BuildContext context) {
    String? userType = Provider.of<AppState>(context).usuarioLogeado?.tipo;
    String correo = Provider.of<AppState>(context).usuarioLogeado!.correo;
    if (userType == 'Profesor')
      isTeacher = true;
    else
      isTeacher = false;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 62, 103, 215),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/LogoMenu.png'))),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              size: 35,
              color: Colors.black,
            ),
            title: Text(
              'MI PERFIL',
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'NerkoOne',
              ),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Available_Teacher(mail:correo)))
            },
          ),
          isTeacher
              ? ListTile(
                  leading: Icon(
                    Icons.calendar_today_rounded,
                    size: 35,
                    color: Colors.black,
                  ),
                  title: Text(
                    'MI DISPONIBILIDAD',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'NerkoOne',
                    ),
                  ),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Available_Teacher(mail:correo),
                      ),
                    ),
                  },
                )
              : Container(),
          !isTeacher
              ? ListTile(
                  leading: Icon(
                    Icons.perm_contact_calendar,
                    size: 35,
                    color: Colors.black,
                  ),
                  title: Text(
                    'BUSCAR CLASE',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'NerkoOne',
                    ),
                  ),
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyFind_Class()))
                  },
                )
              : Container(),
          isTeacher
              ? ListTile(
                  leading: Icon(
                    Icons.paid,
                    size: 35,
                    color: Colors.black,
                  ),
                  title: Text(
                    'MI BALANCE',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'NerkoOne',
                    ),
                  ),
                  onTap: () => {Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotImplemented()))},
                )
              : Container(),
          ListTile(
            leading: Icon(
              Icons.inventory_2,
              size: 35,
              color: Colors.black,
            ),
            title: Text(
              'HISTORIAL DE CLASES',
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'NerkoOne',
              ),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotImplemented()))
            },
          ),
          ListTile(
            leading: Icon(
              Icons.event_note,
              size: 35,
              color: Colors.black,
            ),
            title: Text(
              'PRÓXIMAS CLASES',
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'NerkoOne',
              ),
            ),
            onTap: () async {
                List<Lesson> lessons = await helperAuth.getAllLessonsByEmail(correo); //= new List.empty();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NextLessons(
                                lessons: lessons,
                              )));
                },
          ),
          ListTile(
            leading: Icon(
              Icons.contact_support,
              size: 35,
              color: Colors.black,
            ),
            title: Text(
              'SOPORTE Y AYUDA',
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'NerkoOne',
              ),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Help(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              size: 35,
              color: Colors.black,
            ),
            title: Text(
              'SALIR',
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'NerkoOne',
              ),
            ),
            onTap: () async => {
              // Muestra el diálogo de carga
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return WillPopScope(
                    onWillPop: () async => false,
                    child: AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text('Cerrando sesión...'),
                        ],
                      ),
                    ),
                  );
                },
              ),

              await Future.delayed(Duration(seconds: 2)),

              Provider.of<AppState>(context, listen: false).logout(),
              helperAuth.signOut(),
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyLoggin()))
            },
          ),
        ],
      ),
    );
  }
}
