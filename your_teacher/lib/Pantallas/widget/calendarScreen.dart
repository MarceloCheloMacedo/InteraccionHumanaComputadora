import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:your_teacher/Dominios/Disponibilidad.dart';
import 'package:your_teacher/Dominios/user.dart';

class CalendarScreen extends StatelessWidget {
  @override
  //_CalendarScreenState createState() => _CalendarScreenState();
  const CalendarScreen({super.key, required this.userSelected, required this.disponibilidad,required this.daySelected});
  final User userSelected;
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

    return Expanded(
      child: ListView.builder(
        itemCount: hoursOfDay.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(hoursOfDay[index]),
            leading: Icon(
              isHourOccupied(index,daySelected)
                  ? Icons.event_busy
                  : Icons.event_available,
              color: isHourOccupied(index,daySelected)
                  ? Colors.red
                  : Colors.green,
            ),
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
