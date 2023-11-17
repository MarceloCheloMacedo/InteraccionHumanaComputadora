import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

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
  String? _dateOfBirth;
  String? _role = "Student"; // Valor predeterminado para el radio button
  String countryValue = "";
  String? stateValue = "";
  String? cityValue = "";

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
              DateTimeFormField(
                mode: DateTimeFieldPickerMode.date,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  suffixIcon: Icon(Icons.event_note),
                  labelText: 'Fecha de nacimiento',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                firstDate: DateTime.now().add(const Duration(days: 10)),
                lastDate: DateTime.now().add(const Duration(days: 40)),
                initialDate: DateTime.now().add(const Duration(days: 20)),
                autovalidateMode: AutovalidateMode.always,
                validator: (DateTime? e) =>
                    (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {
                  print(value);
                  _dateOfBirth = value.toString();
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(''),
              ),
              CSCPicker(
                ///Enable disable state dropdown [OPTIONAL PARAMETER]
                showStates: true,

                /// Enable disable city drop down [OPTIONAL PARAMETER]
                showCities: false,

                ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                flagState: CountryFlag.DISABLE,

                ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),

                ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade300,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),

                ///placeholders for dropdown search field
                countrySearchPlaceholder: "País",
                stateSearchPlaceholder: "Localidad",
                citySearchPlaceholder: "City",

                ///labels for dropdown
                countryDropdownLabel: "*País",
                stateDropdownLabel: "*Localidad",
                cityDropdownLabel: "*City",

                ///Default Country
                defaultCountry: CscCountry.Uruguay,

                ///Disable country dropdown (Note: use it with default country)
                //disableCountry: true,

                ///Country Filter [OPTIONAL PARAMETER]
                //  countryFilter: [CscCountry.India,CscCountry.United_States,CscCountry.Canada],

                ///selected item style [OPTIONAL PARAMETER]
                selectedItemStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),

                ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                dropdownHeadingStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),

                ///DropdownDialog Item style [OPTIONAL PARAMETER]
                dropdownItemStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),

                ///Dialog box radius [OPTIONAL PARAMETER]
                dropdownDialogRadius: 10.0,

                ///Search bar radius [OPTIONAL PARAMETER]
                searchBarRadius: 10.0,

                ///triggers once country selected in dropdown
                onCountryChanged: (value) {
                  setState(() {
                    ///store value in country variable
                    countryValue = value;
                  });
                },

                ///triggers once state selected in dropdown
                onStateChanged: (value) {
                  setState(() {
                    ///store value in state variable
                    stateValue = value;
                  });
                },

                ///triggers once city selected in dropdown
                onCityChanged: (value) {
                  setState(() {
                    ///store value in city variable
                    cityValue = value;
                  });
                },
              ),
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
}
