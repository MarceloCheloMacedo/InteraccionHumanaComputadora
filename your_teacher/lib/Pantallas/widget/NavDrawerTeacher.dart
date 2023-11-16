import 'package:flutter/material.dart';
import 'package:your_teacher/Pantallas/find_class.dart';

class NavDrawerTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 62, 103, 215),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/LogoMenu.png'))),
          ),
          ListTile(
            leading: Icon(Icons.person,size: 35,color:Colors.black,),
            title: Text('MI PERFIL',
              style: TextStyle(                
                fontSize: 25.0,
                fontFamily: 'NerkoOne',
              ),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.access_time,size: 35,color:Colors.black,),
            title: Text('MI DISPONIBILIDAD',
              style: TextStyle(                
                fontSize: 25.0,
                fontFamily: 'NerkoOne',
              ),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.inventory_2,size: 35,color:Colors.black,),
            title: Text('HISTORIAL DE CLASES',
              style: TextStyle(                
                fontSize: 25.0,
                fontFamily: 'NerkoOne',
              ),),
            onTap: () => {Navigator.of(context).pop()},
          ),          
          ListTile(
            leading: Icon(Icons.event_note,size: 35,color:Colors.black,),
            title: Text('PRÓXIMAS CLASES',
                      style: TextStyle(                
                        fontSize: 25.0,
                        fontFamily: 'NerkoOne',
                      ),
                    ),
            onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyFind_Class()));
                  },        
          ),
          ListTile(
            leading: Icon(Icons.contact_support, size: 35,color:Colors.black,),
            title: Text('SOPORTE Y AYUDA',
              style: TextStyle(                
                fontSize: 25.0,
                fontFamily: 'NerkoOne',
              ),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app,size: 35,color:Colors.black,),
            title: Text('SALIR',
              style: TextStyle(                
                fontSize: 25.0,
                fontFamily: 'NerkoOne',
              ),),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}