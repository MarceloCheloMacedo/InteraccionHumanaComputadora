import 'package:flutter/material.dart';
import 'package:your_teacher/Pantallas/widget/NavDrawer.dart';

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text('YOUR TEEACHER'),
      ),
    );
  }
}