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
  TimeOfDay startTimeMonday = TimeOfDay.now();
  TimeOfDay endTimeMonday = TimeOfDay.now();
  String monday = "";
  TimeOfDay startTimeTuesday = TimeOfDay.now();
  TimeOfDay endTimeTuesday = TimeOfDay.now();
  String tuesday = "";
  TimeOfDay startTimeWednesday = TimeOfDay.now();
  TimeOfDay endTimeWednesday = TimeOfDay.now();
  String wednesday = "";
  TimeOfDay startTimeThursday= TimeOfDay.now();
  TimeOfDay endTimeThursday = TimeOfDay.now();
  String thursday = "";
  TimeOfDay startTimeFriday = TimeOfDay.now();
  TimeOfDay endTimeFriday = TimeOfDay.now();
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
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
          margin: const EdgeInsets.all(40.0),
          height: 700,
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
                padding: EdgeInsets.symmetric(vertical: 5.0),
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
                  print(result.toString());
                  setState(() {
                    if (result != null) {
                      monday = result.toString();
                    }
                  });
                },
                child: const Text('Lunes'),
              ),
              Text(monday),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
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
                child: const Text('Martes'),
              ),
              Text(tuesday),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
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
                child: const Text('Miércoles'),
              ),
              Text(wednesday),
            ],
          ),
        ),
      ),
    );
  }
}
