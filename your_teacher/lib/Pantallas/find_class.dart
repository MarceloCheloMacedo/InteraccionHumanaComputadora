import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_teacher/Logica/flutterMethods.dart';
import 'package:your_teacher/Pantallas/Available_Lessons.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:your_teacher/AccesoDatos/firebase_service.dart';
import '../Dominios/user.dart';

class MyFind_Class extends StatefulWidget {
  const MyFind_Class({Key? key});

  @override
  State<MyFind_Class> createState() => _MyFind_ClassState();
}

class _MyFind_ClassState extends State<MyFind_Class> {
  final FirebaseAuthHelper _authHelper = FirebaseAuthHelper();
  //final FirebaseGetHelper _getHelper = FirebaseGetHelper();
  String? daySelected = "";
  List<String> listDays = [
    'Lunes',
    'Martes',
    'Miercoles',
    'Jueves',
    'Viernes',
    'Sabado',
    'Domingo'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 225, 180, 1),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 243, 233, 1),
            border: Border.all(
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
          margin: const EdgeInsets.all(15.0),
          height: 600,
          child: Column(
            children: [
              Text(
                'BUSCAR CLASE',
                style: TextStyle(
                  color: Color.fromRGBO(35, 8, 113, 1),
                  fontSize: 40.0,
                  fontFamily: 'NerkoOne',
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(''),
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  labelText: 'Dia',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                items: listDays.map((e) {
                  return DropdownMenuItem(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        e,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    value: e,
                  );
                }).toList(),
                onChanged: (e) {
                  setState(() {
                    daySelected = e;
                  });
                },
                isDense: true,
                isExpanded: true,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(''),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(''),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 191, 170, 1),
                  fixedSize: const Size.fromWidth(300),
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Ajusta el valor para controlar la cantidad de redondeo
                  ),
                ),
                child: const Text(
                  'BUSCAR',
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
                  List<UserD> teachers =
                      await _authHelper.getUsersWithAvailability(
                          daySelected); //= new List.empty();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Available_Lessons(
                                teachersFilter: teachers,
                                daySelected: daySelected,
                              )));
                },
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}
