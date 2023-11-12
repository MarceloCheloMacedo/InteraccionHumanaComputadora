import 'package:flutter/material.dart';
import 'package:your_teacher/Pantallas/homePage.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() =>
      _BottomNavigationState();
}

class _BottomNavigationState extends State {
  int _selectedTab = 0;

  final List _pages = [     
    {"screen":  MyHomePage(), "title": "YOUR TEACHER"},
    {"screen":  MyHomePage(), "title": "YOUR TEACHER"},
    {"screen":  MyHomePage(), "title": "YOUR TEACHER"}
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: Text(''),
      ),   
      body: _pages[_selectedTab]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),        
        selectedIconTheme: IconThemeData(color: Colors.blue[700], size: 40),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
        ),
        unselectedItemColor: Colors.grey,
        iconSize: 20,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),                                  
                                  label: "Home",
                                  activeIcon: Icon(Icons.home_outlined)
                                 ),
          BottomNavigationBarItem(icon: Icon(Icons.comment),
                                  label: "Comentario",
                                  activeIcon: Icon(Icons.comment_outlined,)
                                 ),
          BottomNavigationBarItem(icon: Icon(Icons.person_2), 
                                  label: "Mi Perfil",
                                  activeIcon: Icon(Icons.person_2_outlined,)
                                 ),  
        ],
      ),
    );
  }
}