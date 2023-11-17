import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:your_teacher/Logica/flutterMethods.dart';
import 'package:time_range_picker/time_range_picker.dart';

class Available_Teacher extends StatefulWidget {
  const Available_Teacher({Key? key});

  @override
  State<Available_Teacher> createState() => _Available_TeacherState();
}

class _Available_TeacherState extends State<Available_Teacher> {
  final format = DateFormat.jm();
  TimeOfDay startTimeMonday  = TimeOfDay(hour:9,minute:0);
  TimeOfDay endTimeMonday    = TimeOfDay(hour:18,minute:0);
  String monday = "";
  TimeOfDay startTimeTuesday = TimeOfDay(hour:9,minute:0);
  TimeOfDay endTimeTuesday   = TimeOfDay(hour:18,minute:0);
  String tuesday = "";
  TimeOfDay startTimeWednesday = TimeOfDay(hour:9,minute:0);
  TimeOfDay endTimeWednesday   = TimeOfDay(hour:18,minute:0);
  String wednesday = "";
  TimeOfDay startTimeThursday  = TimeOfDay(hour:9,minute:0);
  TimeOfDay endTimeThursday    = TimeOfDay(hour:18,minute:0);
  String thursday = "";
  TimeOfDay startTimeFriday    = TimeOfDay(hour:9,minute:0);
  TimeOfDay endTimeFriday      = TimeOfDay(hour:18,minute:0); 
  String friday = "";

  final FirebaseAuthHelper _authHelper = FirebaseAuthHelper();

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
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          margin: const EdgeInsets.all(40.0),
          height: 750,
          child: Column(
            children: [
              Text(
                'INDICAR DISPONIBILIDAD',
                style: TextStyle(
                  color: Color.fromRGBO(35, 8, 113, 1),
                  fontSize: 25.0,
                  fontFamily: 'NerkoOne',
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0),
                child: Text(''),
              ),
              ElevatedButton(
                onPressed: () async {
                  String? result = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        title: const Text("Rango Disponible",
                            textAlign: TextAlign.center),
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 450,
                          child: TimeRangePicker(
                            start: startTimeMonday,
                            end: endTimeMonday,
                            fromText: 'Desde',
                            toText: 'Hasta',
                            hideButtons: true,
                            use24HourFormat: false,
                            onStartChange: (start) {
                              setState(() {
                                startTimeMonday = start;
                              });
                            },
                            onEndChange: (end) {
                              setState(() {
                                endTimeMonday = end;
                              });
                            },
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                              child: const Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop('Inicio :' +
                                  startTimeMonday.toString() +
                                  ' Fin :' +
                                  endTimeMonday.toString());
                            },
                          ),
                        ],
                      );
                    },
                  );             
                  setState(() {
                    if (result != null) {
                      monday = result.toString();
                    }
                  });
                },
                child: const Text('Ingresar Lunes'),
              ),
              Text(monday,
                style: TextStyle(
                  color: Color.fromRGBO(35, 8, 113, 1),
                  fontSize: 18.0,
                  fontFamily: 'NerkoOne',
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0),
                child: Text(''),
              ),
              ElevatedButton(
                onPressed: () async {
                  String? result = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        title: const Text("Rango Disponible",
                            textAlign: TextAlign.center),
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 450,
                          child: TimeRangePicker(
                            start: startTimeTuesday,
                            end: endTimeTuesday,
                            fromText: 'Desde',
                            toText: 'Hasta',
                            hideButtons: true,
                            use24HourFormat: false,
                            onStartChange: (start) {
                              setState(() {
                                startTimeTuesday = start;
                              });
                            },
                            onEndChange: (end) {
                              setState(() {
                                endTimeTuesday = end;
                              });
                            },
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                              child: const Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop('Inicio :' +
                                  startTimeTuesday.toString() +
                                  ' Fin :' +
                                  endTimeTuesday.toString());
                            },
                          ),
                        ],
                      );
                    },
                  );
                  print(result.toString());
                  setState(() {
                    if (result != null) {
                      tuesday = result.toString();
                    }
                  });
                },
                child: const Text('Ingresar Martes'),
              ),
              Text(tuesday,
                style: TextStyle(
                  color: Color.fromRGBO(35, 8, 113, 1),
                  fontSize: 18.0,
                  fontFamily: 'NerkoOne',
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0),
                child: Text(''),
              ),
              ElevatedButton(
                onPressed: () async {
                  String? result = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        title: const Text("Rango Disponible",
                            textAlign: TextAlign.center),
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 450,
                          child: TimeRangePicker(
                            start: startTimeWednesday,
                            end: endTimeWednesday,
                            fromText: 'Desde',
                            toText: 'Hasta',
                            hideButtons: true,
                            use24HourFormat: false,
                            onStartChange: (start) {
                              setState(() {
                                startTimeWednesday = start;
                              });
                            },
                            onEndChange: (end) {
                              setState(() {
                                endTimeWednesday = end;
                              });
                            },
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                              child: const Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop('Inicio :' +
                                  startTimeWednesday.toString() +
                                  ' Fin :' +
                                  endTimeWednesday.toString());
                            },
                          ),
                        ],
                      );
                    },
                  );
                  print(result.toString());
                  setState(() {
                    if (result != null) {
                      wednesday = result.toString();
                    }
                  });
                },
                child: const Text('Ingresar Miércoles'),
              ),
              Text(wednesday,
                style: TextStyle(
                  color: Color.fromRGBO(35, 8, 113, 1),
                  fontSize: 18.0,
                  fontFamily: 'NerkoOne',
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0),
                child: Text(''),
              ),
              ElevatedButton(
                onPressed: () async {
                  String? result = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        title: const Text("Rango Disponible",
                            textAlign: TextAlign.center),
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 450,
                          child: TimeRangePicker(
                            start: startTimeThursday,
                            end: endTimeThursday,
                            fromText: 'Desde',
                            toText: 'Hasta',
                            hideButtons: true,
                            use24HourFormat: false,
                            onStartChange: (start) {
                              setState(() {
                                startTimeThursday = start;
                              });
                            },
                            onEndChange: (end) {
                              setState(() {
                                endTimeThursday = end;
                              });
                            },
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                              child: const Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop('Inicio :' +
                                  startTimeThursday.toString() +
                                  ' Fin :' +
                                  endTimeThursday.toString());
                            },
                          ),
                        ],
                      );
                    },
                  );
                  print(result.toString());
                  setState(() {
                    if (result != null) {
                      thursday = result.toString();
                    }
                  });
                },
                child: const Text('Ingresar Jueves'),
              ),
              Text(thursday,
                style: TextStyle(
                  color: Color.fromRGBO(35, 8, 113, 1),
                  fontSize: 18.0,
                  fontFamily: 'NerkoOne',
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0),
                child: Text(''),
              ),
              ElevatedButton(
                onPressed: () async {
                  String? result = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        title: const Text("Rango Disponible",
                            textAlign: TextAlign.center),
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 450,
                          child: TimeRangePicker(
                            start: startTimeFriday,
                            end: endTimeFriday,
                            fromText: 'Desde',
                            toText: 'Hasta',
                            hideButtons: true,
                            use24HourFormat: false,
                            onStartChange: (start) {
                              setState(() {
                                startTimeFriday = start;
                              });
                            },
                            onEndChange: (end) {
                              setState(() {
                                endTimeFriday = end;
                              });
                            },
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                              child: const Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop('Inicio :' +
                                  startTimeFriday.toString() +
                                  ' Fin :' +
                                  endTimeFriday.toString());
                            },
                          ),
                        ],
                      );
                    },
                  );
                  print(result.toString());
                  setState(() {
                    if (result != null) {
                      friday = result.toString();
                    }
                  });
                },
                child: const Text('Ingresar Viernes'),
              ),
              Text(friday,
                style: TextStyle(
                  color: Color.fromRGBO(35, 8, 113, 1),
                  fontSize: 18.0,
                  fontFamily: 'NerkoOne',
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(''),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 191, 170, 1),
                  fixedSize: const Size.fromWidth(250),
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Ajusta el valor para controlar la cantidad de redondeo
                  ),
                ),
                child: const Text(
                  'ENVIAR',
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
