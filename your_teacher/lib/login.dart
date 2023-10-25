import 'package:firebase_auth/firebase_auth.dart';
import 'package:your_teacher/register.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_teacher/Tools/colors.dart';
import 'package:your_teacher/flutterMethods.dart';

class MyLoggin extends StatefulWidget {
  const MyLoggin({Key? key});

  @override
  State<MyLoggin> createState() => _MyLogginState();
}

class _MyLogginState extends State<MyLoggin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuthHelper _authHelper = FirebaseAuthHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('images/YourTeacherLogo.png'),
              ),
              const SizedBox(
                  height: 10), // Agregar un espacio entre el logo y el título
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Your',
                      style: TextStyle(
                        color: Colors.red, // Color rojo para "Your"
                        fontFamily: 'NerkoOne',
                        fontSize: 50.0,
                      ),
                    ),
                    TextSpan(
                      text: ' Teacher',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 8, 73, 127), // Color azul para "Teacher"
                        fontFamily: 'NerkoOne',
                        fontSize: 50.0,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Login',
                style: TextStyle(fontFamily: 'NerkoOne', fontSize: 50.0),
              ),
              const Text(
                '',
                style: TextStyle(fontFamily: 'NerkoOne', fontSize: 20.0),
              ),
              const SizedBox(
                width: 160.0,
                height: 15.0,
                child: Divider(color: Colors.blueGrey),
              ),

              const Divider(
                height: 18.0,
              ),
              TextField(
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
              const Divider(
                height: 15.0,
              ),
              TextField(
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
              const Divider(
                height: 15.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  fixedSize: const Size.fromWidth(300),
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Ajusta el valor para controlar la cantidad de redondeo
                  ),
                ),
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20.0,
                    fontFamily: 'NerkoOne',
                  ),
                ),
                onPressed: () async {
                  String email = emailController.text;
                  String password = passwordController.text;
                  User? user = await _authHelper.signInWithEmailAndPassword(
                      email, password);
                  //  var user;
                  print('Valor de una variable:');
                  if (user != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Inicio de sesión con Google exitoso'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Error al iniciar sesión con Google'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 5), // Agregar espacio entre los botones
              const Text('OR',
                  style: TextStyle(
                      fontFamily: 'NerkoOne',
                      fontSize: 20.0,
                      color:
                          Colors.grey) // Cambiamos el color del texto a gris,

                  ),
              const SizedBox(
                width: 160.0,
                height: 15.0,
                child: Divider(color: Colors.blueGrey),
              ),

              const Divider(
                height: 2.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: googleColor,
                  fixedSize: const Size.fromWidth(300),
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Ajusta el valor para controlar la cantidad de redondeo
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Register()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons
                          .googlePlusG, // Aquí puedes elegir el icono que desees
                      color: Colors.white70,
                      size:
                          24.0, // Puedes ajustar el tamaño del icono según tus necesidades
                    ),
                    SizedBox(width: 16), // Espacio entre el icono y el texto
                    Text(
                      'Register with Google',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: googleColor,
                        fontSize: 20.0,
                        fontFamily: 'NerkoOne',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
