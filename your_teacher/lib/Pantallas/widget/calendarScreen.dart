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
        children: [/*
          TableCalendar(
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2023, 12, 31),
            selectedDayPredicate: (day) {
              // Verifica si el día seleccionado está ocupado
              return isDayOccupied(day);
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
          ),*/
          SizedBox(height: 20),
         /* _selectedDay != null
              ? _buildHourList()
              : Text(userSelected.name),*/
        ],
      ),
    );
  }

  bool isDayOccupied(DateTime day) {
    // Simulación de horas ocupadas
    // Aquí deberías implementar tu lógica real para verificar si hay horas ocupadas en el día seleccionado
    return day.day == 20 && day.month == 11 && day.year == 2023;
  }

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
              isHourOccupied(hoursOfDay[index])
                  ? Icons.event_busy
                  : Icons.event_available,
              color: isHourOccupied(hoursOfDay[index])
                  ? Colors.red
                  : Colors.green,
            ),
          );
        },
      ),
    );
  }

  bool isHourOccupied(String hour) {
    // Simulación de horas ocupadas
    // Aquí deberías implementar tu lógica real para verificar si una hora está ocupada
    // Puedes usar la hora seleccionada (_selectedDay) junto con la hora actual para realizar esta verificación
    return hour == '9:00' || hour == '13:00' || hour == '18:00';
  }
}
