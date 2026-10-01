import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome to homepage!",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 4, 253, 62),
          ),
        ),
      ),
    );
  }
}