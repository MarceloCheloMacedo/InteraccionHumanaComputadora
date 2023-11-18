import 'package:flutter/material.dart';
import 'package:your_teacher/Pantallas/widget/NavDrawerStudent.dart';

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawerStudent(),
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text('YOUR TEACHER'),
      ),
    );
  }
}