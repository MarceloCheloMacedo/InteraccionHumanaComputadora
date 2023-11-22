import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:your_teacher/Dominios/Disponibilidad.dart';
import 'package:your_teacher/Dominios/user.dart';
import 'package:your_teacher/Pantallas/find_class.dart';

class CalendarScreen extends StatelessWidget {
  @override
  //_CalendarScreenState createState() => _CalendarScreenState();
  const CalendarScreen({super.key, required this.userSelected, required this.disponibilidad,required this.daySelected});
  final UserD userSelected;
  final String? daySelected;
  final Disponibilidad? disponibilidad;
  


/*
class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario con horas del día'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          daySelected != null
              ? _buildHourList()
              : Text(userSelected.nombre),
        ],
      ),
    );
  }
/*
  bool isDayOccupied(DateTime day) {
    // Simulación de horas ocupadas
    // Aquí deberías implementar tu lógica real para verificar si hay horas ocupadas en el día seleccionado
    return day.day == 20 && day.month == 11 && day.year == 2023;
  }
*/
  Widget _buildHourList() {
    // Simulación de horas del día
    List<String> hoursOfDay = List.generate(24, (index) => '$index:00');
    List<bool> hoursOfDayBool = List.generate(24, (index) => false);
    bool ocuped;

    return Expanded(
      child: ListView.builder(
        itemCount: hoursOfDay.length,
        itemBuilder: (context, index) {
        ocuped = isHourOccupied(index,daySelected);
        hoursOfDayBool[index] = ocuped;
          return ListTile(
            title: Text(hoursOfDay[index]),
            leading: Icon(
              ocuped
                  ? Icons.event_busy
                  : Icons.event_available,
              color: ocuped
                  ? Colors.red
                  : Colors.green,
            ),
            onTap: () => _dialogBuilder(context,hoursOfDayBool[index]),
          );
        },
      ),
    );
  }

  bool isHourOccupied(int hour,String? day) {

    String?  d;
    switch (day) {
      case 'Domingo':
        d = disponibilidad?.domingo;
        break;
      case 'Lunes':
        d = disponibilidad?.lunes;
        break;
      case 'Martes':
        d = disponibilidad?.martes;
        break;
      case 'Miercoles':
        d = disponibilidad?.miercoles;
        break;
      case 'Jueves':
        d = disponibilidad?.jueves;
        break;
      case 'viernes':
        d = disponibilidad?.viernes;
        break;
      case 'Sabado':
        d = disponibilidad?.sabado;
        break;
      default:
        d = null;
        break;
    }

    List<String>? dispo = d?.split('-');
    String? iniHour = dispo?[0].split(':')[0];
    String? finHour = dispo?[1].split(':')[0];

    return isInRange(hour,int.parse(iniHour!), int.parse(finHour!));
  }

  bool isInRange(int hour, int ini, int fin){
    return !(hour>=ini && hour<=fin);
  }
}

Future<void> _dialogBuilder(BuildContext context,bool ocuped) {

    if(ocuped){
        return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            'HORARIO NO DISPONIBLE!',
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

    else{

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
                onPressed: () {
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
