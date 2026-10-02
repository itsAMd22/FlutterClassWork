import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage 64B"),
        backgroundColor: const Color.fromARGB(255, 225, 87, 23),
        foregroundColor: Colors.white,
        leading: Icon(Icons.home),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.person)),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome to homepage!",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 1, 0, 18),
          ),
        ),
      ),
    );
  }
}