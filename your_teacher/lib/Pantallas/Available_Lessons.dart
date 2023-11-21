import 'package:flutter/material.dart';
import 'package:your_teacher/Pantallas/find_class.dart';
import 'package:your_teacher/Dominios/user.dart';

class Available_Lessons extends StatelessWidget {
  const Available_Lessons({super.key, required this.teachersFilter});
  final List<UserD> teachersFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView.builder(
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
                onTap: () => _dialogBuilder(context),
              ));
        },
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            'AGENDADO EXITOSAMENTE!',
            style: TextStyle(
              color: Color.fromRGBO(35, 8, 113, 1),
              fontSize: 25.0,
              fontFamily: 'NerkoOne',
            ),
          ),
          backgroundColor: const Color.fromRGBO(246, 243, 233, 1),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(0, 191, 170, 1),
                  fixedSize: const Size.fromWidth(100),
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Ajusta el valor para controlar la cantidad de redondeo
                  ),
                ),
                child: const Text(
                  'ACEPTAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: 'NerkoOne',
                    shadows: [
                      Shadow(
                        color: Color.fromARGB(255, 110, 108,
                            108), // Choose the color of the shadow
                        blurRadius:
                            10.0, // Adjust the blur radius for the shadow effect
                        offset: Offset(0.0,
                            4.0), // Set the horizontal and vertical offset for the shadow
                      ),
                    ],
                  ),
                ),
                onPressed: () async {
                  print(teachersFilter[0].nombre);
                  print(teachersFilter[0].correo);
                  print(teachersFilter[0].uid);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyFind_Class()));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
