import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;
  String? _firstName;
  String? _lastName;
  DateTime? _dateOfBirth;
  String? _role = "Student"; // Valor predeterminado para el radio button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, ingrese un email válido";
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Nombre"),
                onSaved: (value) {
                  _firstName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Apellido"),
                onSaved: (value) {
                  _lastName = value;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(
                      16), // Aumenta el espacio para el texto
                ),
                child: Text(
                  _dateOfBirth != null
                      ? "Fecha de Nacimiento: ${_dateOfBirth!.toLocal()}"
                          .split(' ')[0]
                      : "Fecha de Nacimiento",
                ),
              ),
              if (_dateOfBirth != null)
                Text("Fecha seleccionada: ${_dateOfBirth!.toLocal()}"
                    .split(' ')[0]),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Aquí puedes enviar los datos a tu servidor o realizar la acción de registro.
                    // También puedes utilizar _email, _firstName, _lastName, _dateOfBirth y _role.
                  }
                },
                child: Text("Finalizar Registro"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateOfBirth ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _dateOfBirth) {
      setState(() {
        _dateOfBirth = picked;
      });
      print("Fecha seleccionada: ${_dateOfBirth!.toLocal()}");
    }
  }
}
