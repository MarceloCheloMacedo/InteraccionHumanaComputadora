import 'package:flutter/material.dart';
import 'package:your_teacher/Pantallas/find_class.dart';
import 'package:your_teacher/Dominios/user.dart';

class Available_Lessons extends StatelessWidget {
    
  const Available_Lessons({super.key, required this.teachersFilter});
  final List<User> teachersFilter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "route",
        home: Scaffold(
          backgroundColor: const Color.fromRGBO(247, 225, 180, 1),
          body: ListView.builder(
                  itemCount: teachersFilter.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(teachersFilter[index].displayName),            
                      onTap: () => _dialogBuilder(context),
                    );                  
                  },
                ),                                             
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
                  print(teachersFilter[0].displayName);
                  print(teachersFilter[0].email);
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
