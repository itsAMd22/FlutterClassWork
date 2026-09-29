import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "Welcome to homepage!",
        style: TextStyle(
          fontSize: 20,
          color: const Color.fromARGB(255, 4, 253, 62)
        ),
      )
    );
  }   
}