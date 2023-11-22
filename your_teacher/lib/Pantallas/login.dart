import 'package:firebase_auth/firebase_auth.dart';
import 'package:your_teacher/AccesoDatos/Manage_Context.dart';
import 'package:your_teacher/Pantallas/homePage.dart';
import 'package:your_teacher/Pantallas/register.dart';
import 'package:flutter/material.dart';
import 'package:your_teacher/Logica/flutterMethods.dart';
import 'package:provider/provider.dart';

class MyLoggin extends StatefulWidget {
  const MyLoggin({Key? key});

  @override
  State<MyLoggin> createState() => _MyLogginState();
}

class _MyLogginState extends State<MyLoggin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuthHelper _authHelper = FirebaseAuthHelper();
  double fontSizeRegister = 20.0; // Tamaño de letra aumentado en 2 unidades.

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
                onChanged: (_) {
                  setState(() {});
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
                onChanged: (_) {
                  setState(() {});
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
                  'Sign in',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20.0,
                    fontFamily: 'NerkoOne',
                  ),
                ),
                onPressed: (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty)
                    ? () async {
                        String email = emailController.text;
                        String password = passwordController.text;

                        User? user =
                            await _authHelper.signInWithEmailAndPassword(
                                email, password, context);
                        //  var user;
                        //

                        if (user != null) {
                          Provider.of<AppState>(context, listen: false)
                              .setUsuarioLogeado(emailController.text ?? '');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Inicio de sesión exitoso'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }

                        await Future.delayed(Duration(seconds: 1));
                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        }
                      }
                    : null,
              ),

              // String? email =
              //        Provider.of<AppState>(context).usuarioLogeado;
              const SizedBox(height: 5), // Agregar espacio entre los botones
              const Text('Not a member?',
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
              MouseRegion(
                child: InkWell(
                  child: Text(
                    "Regístrate",
                    style: TextStyle(
                      color: Color.fromARGB(255, 17, 54, 201),
                      fontSize: fontSizeRegister,
                      decoration: TextDecoration.underline,
                      fontFamily:
                          'NerkoOne', // Cambia el color de texto según tus preferencias.
                      // Puedes ajustar otras propiedades de estilo de texto aquí.
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()));
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
