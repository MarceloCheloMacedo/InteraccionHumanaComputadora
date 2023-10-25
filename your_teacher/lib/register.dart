import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "route",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Second Screen"),
          ),
          body: Center(
            child: ElevatedButton(
              child: const Text("Go back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ));
  }
}
