import 'package:date_field/date_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:your_teacher/AccesoDatos/firebase_service.dart';
import 'package:your_teacher/Dominios/user.dart';
import 'package:your_teacher/Logica/flutterMethods.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:your_teacher/Pantallas/login.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? selectedGender = 'Alumno';

  Widget _buildRadioButtonGroup() {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Tipo de cuenta',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Row(
          children: <Widget>[
            Expanded(
              child: RadioListTile(
                title: Text('Alumno'),
                value: 'Alumno',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value.toString();
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text('Profesor'),
                value: 'Profesor',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value.toString();
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FirebaseAuthHelper helperAuth = new FirebaseAuthHelper();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  String _dateOfBirth = "";
  String _role = "Student";
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: TextField(
                    controller: nameController,
                    enableInteractiveSelection: false,
                    autofocus: true,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      hintText: 'Nombre',
                      labelText: 'Nombre',
                      suffixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    onSubmitted: (valor) {
                      // _email = valor;
                      //print('El email es $_email');
                    },
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  height: 50,
                  child: TextField(
                    controller: lastNameController,
                    enableInteractiveSelection: false,
                    autofocus: true,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      hintText: 'Apellido',
                      labelText: 'Apellido',
                      suffixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    onSubmitted: (valor) {
                      // _email = valor;
                      //print('El email es $_email');
                    },
                  ),
                ),
                SizedBox(height: 12),

                InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1920, 1, 1),
                      lastDate: DateTime.now().add(const Duration(days: 1)),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        _dateOfBirth =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                      });
                    }
                  },
                  child: Container(
                    height: 50,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Fecha de nacimiento',
                        //suffixIcon: Icon(Icons.event_note),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(_dateOfBirth),
                          Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(''),
                ),
                _buildRadioButtonGroup(),
                Text(
                  'Lugar de Nacimiento',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                CSCPicker(
                  ///Enable disable state dropdown [OPTIONAL PARAMETER]
                  showStates: false,

                  /// Enable disable city drop down [OPTIONAL PARAMETER]
                  showCities: true,

                  ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                  flagState: CountryFlag.DISABLE,

                  ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                  ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade300,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

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

                Text(
                  'Datos de acceso',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //Email
                Container(
                  height: 50,
                  child: TextField(
                    controller: emailController,
                    enableInteractiveSelection: false,
                    autofocus: true,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      hintText: 'EMAIL',
                      labelText: 'Email',
                      suffixIcon: const Icon(Icons.alternate_email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    onSubmitted: (valor) {},
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  height: 50,
                  child: TextField(
                    controller:
                        passwordController, // Asigna el controlador de contraseña
                    enableInteractiveSelection: false,
                    obscureText: true,
                    autofocus: true,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      suffixIcon: const Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    onSubmitted: (valor) {},
                  ),
                ),
                SizedBox(height: 18),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Ajusta el valor para controlar la cantidad de redondeo
                    ),
                  ),
                  onPressed: () async {
                    String nombre = nameController.text;
                    String apellido = lastNameController.text;

                    String tipoCuenta = selectedGender ??
                        'Alumno'; // Si es nulo, establecer a 'Alumno'
                    String paisNacimiento = countryValue;
                    String email = emailController.text;
                    String password = passwordController.text;

                    UserD newUser = UserD(
                      correo: email,
                      nombre: nombre,
                      apellido: apellido,
                      foto: "",
                      tipo: tipoCuenta,
                      pais: paisNacimiento,
                      fechaNacimiento: DateTime.parse(_dateOfBirth),
                    );

                    User? userFirebase =
                        await helperAuth.signUpWithEmailAndPassword(
                            emailController.text,
                            passwordController.text,
                            context,
                            newUser);

                    if (userFirebase != null) {
                      // El usuario se registró con éxito, redirige a otra página.
                      await Future.delayed(Duration(seconds: 2));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyLoggin(),
                        ),
                      );
                    }
                    ;
                  },
                  child: const Text(
                    'Finalizar registro',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20.0,
                      fontFamily: 'NerkoOne',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
