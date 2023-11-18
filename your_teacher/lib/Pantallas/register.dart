import 'package:date_field/date_field.dart';
import 'package:your_teacher/Logica/flutterMethods.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FirebaseAuthHelper helperAuth = new FirebaseAuthHelper();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  String _dateOfBirth = "";
  String _role = "Student";
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  String _selectedItem = 'Opción 1';
  List<String> _items = ['Alumno', 'Profesor'];

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

                Text(
                  'Lugar de Nacimiento',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                CSCPicker(),
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
                    onSubmitted: (valor) {
                      //_password = valor;
                      //print('El password es $_password');
                    },
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
                    helperAuth.signUpWithEmailAndPassword(
                        emailController.text, passwordController.text, context);

                    // Registro exitoso, puedes redirigir al usuario a la página principal o mostrar un mensaje de éxito.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Registro exitoso'),
                        backgroundColor: Colors.green,
                      ),
                    );
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
