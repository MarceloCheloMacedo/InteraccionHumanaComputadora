import 'package:flutter/material.dart';
import 'package:your_teacher/Pantallas/widget/NavDrawerStudentTeacher.dart';

class Help extends StatefulWidget {
  const Help({Key? key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawerStudentTeacher(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(247, 225, 180, 1),
          title: Text(''),
        ),
        backgroundColor: const Color.fromRGBO(247, 225, 180, 1),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: Column(children: [
              RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                    text: "Canales de contacto ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      height: 1.5,
                      fontFamily: 'NerkoOne',
                    )),
              ),
              RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                    text:
                        "Si tenés alguna duda, comunicate con nosotros y te ayudaremos  ",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      height: 1.0,
                      fontFamily: 'NerkoOne',
                    )),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(''),
              ),
              Card(
                elevation: 8,
                color: Colors.white,
                child: ListTile(
                  leading: new Image.asset(
                    "images/comments.png",
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    "Chat en la App",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'NerkoOne',
                    ),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      text: 'Hace tu consulta a través del ',
                      style: TextStyle(
                        fontSize: 19.0,
                        fontFamily: 'NerkoOne',
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'chat',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue[700],
                                color: Colors.blue[700])),
                        TextSpan(
                          text: ' de la App',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(''),
              ),
              ListTile(
                leading: Icon(
                  Icons.campaign_outlined,
                  size: 40.0,
                  color: Color.fromRGBO(69, 125, 203, 1),
                ),
                title: Text(
                  "Redes sociales",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'NerkoOne',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text.rich(
                  TextSpan(
                    text: 'A través de ',
                    style: TextStyle(
                      fontSize: 19.0,
                      fontFamily: 'NerkoOne',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Instagram',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue[700],
                              color: Colors.blue[700])),
                      TextSpan(
                        text: ', ',
                      ),
                      TextSpan(
                          text: 'Twitter',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue[700],
                              color: Colors.blue[700])),
                      TextSpan(
                        text: ' y ',
                      ),
                      TextSpan(
                          text: 'Facebook',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue[700],
                              color: Colors.blue[700])),
                      // can add more TextSpans here...
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.black12),
              ListTile(
                leading: Icon(
                  Icons.email_outlined,
                  size: 40.0,
                  color: Color.fromRGBO(69, 125, 203, 1),
                ),
                title: Text(
                  "Correo electrónico",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'NerkoOne',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text.rich(
                  TextSpan(
                    text: 'Nuestro mail es ',
                    style: TextStyle(
                      fontSize: 19.0,
                      fontFamily: 'NerkoOne',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'info@yourTeacher.com',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue[700],
                              color: Colors.blue[700])),
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.black12),
              ListTile(
                leading: Icon(
                  Icons.phone_android_outlined,
                  size: 40.0,
                  color: Color.fromRGBO(69, 125, 203, 1),
                ),
                title: Text(
                  "Teléfono",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'NerkoOne',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Llamá al (+598) 3652 5874",
                  style: TextStyle(
                    fontSize: 19.0,
                    fontFamily: 'NerkoOne',
                  ),
                ),
              ),
            ])));
  }
}
