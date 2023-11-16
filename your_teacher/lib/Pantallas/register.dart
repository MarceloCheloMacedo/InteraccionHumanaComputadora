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
        title: const Text("Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildTextField("Email", Icons.email, (value) {
                _email = value;
              }),
              _buildTextField("Nombre", Icons.person, (value) {
                _firstName = value;
              }),
              _buildTextField("Apellido", Icons.person, (value) {
                _lastName = value;
              }),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
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
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Aquí puedes enviar los datos a tu servidor o realizar la acción de registro.
                    // También puedes utilizar _email, _firstName, _lastName, _dateOfBirth y _role.
                  }
                },
                child: const Text("Finalizar Registro"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String labelText,
    IconData? icon, // Añade un parámetro para el icono
    FormFieldSetter<String>? onSaved,
  ) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: labelText,
        labelText: labelText,
        suffixIcon: icon != null
            ? Icon(icon)
            : null, // Utiliza el icono si está presente
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      validator: (value) {
        if (icon == Icons.mail && (value == null || value.isEmpty)) {
          print("Por favor, ingrese un dato válido");
        }
        return null; // Siempre devuelve null para no bloquear la validación
      },
      onSaved: onSaved,
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
