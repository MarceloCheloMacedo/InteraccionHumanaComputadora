import 'package:flutter/material.dart';
import 'package:your_teacher/Pantallas/login.dart';
class MyMenu extends StatefulWidget {
  const MyMenu({Key? key});


  @override
  _MyMenuState createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  bool isTeacher = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Your Teacher'),
          backgroundColor: Colors.blueGrey[100],
          shadowColor: Colors.blueGrey[100] ,
        ),
      backgroundColor: Colors.blueGrey[100],
      body: ListView(
        padding: const EdgeInsets.only(left: 0,top: 30),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : [
              TextButton.icon(     // <-- TextButton
                onPressed: () {},
                icon: const Icon(
                  Icons.account_box_rounded,
                  size: 70.0,
                  color: Colors.black,
                ),
                label: const Text(
                  'Mi Perfil                 ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontFamily: 'NerkoOne',
                  ),
                ),
              ),
              TextButton.icon(     // <-- TextButton
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_month_rounded,
                  size: 70.0,
                  color: Colors.black,
                  
                ),
                label: const Text('Mi Disponibilidad    ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontFamily: 'NerkoOne',
                    
                  ),),
              ),
              TextButton.icon(     // <-- TextButton
                onPressed: () {},
                icon: const Icon(
                  Icons.event_note_rounded,
                  size: 70.0,
                  color: Colors.black,
                ),
                label: const Text(
                  'Historial de Clases ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontFamily: 'NerkoOne',
                  ),
                ),
              ),
              TextButton.icon(     // <-- TextButton
                onPressed: () {},
                icon: const Icon(
                  Icons.event_note_rounded,
                  size: 70.0,
                  color: Colors.black,
                ),
                label: const Text(
                  'Próximas Clases    ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontFamily: 'NerkoOne',
                  ),
                ),
              ),
              isTeacher ?
               TextButton.icon(     // <-- TextButton
                onPressed: () {},
                icon: const Icon(
                  Icons.monetization_on_rounded,
                  size: 70.0,
                  color: Colors.black,
                ),
                label: const Text(
                  'Mi Balance            ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontFamily: 'NerkoOne',
                  ),
                ),
              )
              : Container(),
              TextButton.icon(     // <-- TextButton
                onPressed: () {},
                icon: const Icon(
                  Icons.contact_support_rounded,
                  size: 70.0,
                  color: Colors.black,
                ),
                label: const Text(
                  'Soporte y Ayuda   ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontFamily: 'NerkoOne',
                  ),
                ),
              ),
              TextButton.icon(     // <-- TextButton
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyLoggin()));
                },
                icon: const Icon(
                  Icons.exit_to_app_rounded,
                  size: 70.0,
                  color: Colors.black,
                ),
                label: const Text(
                  'Salir                   ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontFamily: 'NerkoOne',
                  ),
                ),
              ),
            ]
          )
            ],
      
          )


      );
  }
}
