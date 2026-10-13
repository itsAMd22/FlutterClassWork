import 'package:flutter/material.dart';
import 'package:not_to_do_app/util/introButton.dart';

class IntroPage extends StatelessWidget{
  const IntroPage({super.key});
  Widget build(BuildContext context){
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ?Colors.grey.shade800 :  Colors.grey.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // logo
            Icon(
              Icons.today_outlined,
              color: isDark ?Colors.grey.shade100 :  Colors.grey.shade900, 
            ),


            const SizedBox(height: 25),

            Text(
              "notToDoApp",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            // subtitle
            const SizedBox(height: 10),

            Text(
              "bindas",
              style: TextStyle(
                // fontStyle: ,
                letterSpacing: 5,
                color: isDark ?Colors.grey.shade400 :  Colors.grey.shade700, 
              ),
            ),

            IntroButton(
              onTap: () => {Navigator.pushNamed(context, '/homepage')}, 
              child: Icon(Icons.arrow_forward_ios_sharp),
            ),
          ],
        ),
      ),
    );
  }
}