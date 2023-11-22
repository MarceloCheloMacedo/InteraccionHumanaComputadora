import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_teacher/AccesoDatos/Manage_Context.dart';
import 'package:your_teacher/Pantallas/widget/NavDrawerStudentTeacher.dart';
import 'package:your_teacher/Pantallas/501NotImplemented.dart';

class NotImplemented extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: NavDrawerStudentTeacher(),
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(

        child: Image.asset('images/501.png')
      ),
      
    );
  }
}
