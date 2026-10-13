import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{

  const LoginPage({
    super.key,
  });

  Widget build(BuildContext context){
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final _color_fore = isDark ?Colors.grey.shade400 :  Colors.grey.shade700;
    return Scaffold(
      backgroundColor: isDark ?Colors.grey.shade700 :  Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            
            // logo
            Center(
              child: Icon(
                Icons.today_outlined,
                size: 100,
              ),
            ),
            // welcome back
            Text(
              "Welcome back, you lazy freak!",
              style: TextStyle(
                color: _color_fore
              ),
            ),


            // username textfield
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: isDark ?Colors.grey.shade500 :  Colors.grey.shade600),
                  ),
              
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: _color_fore),
                  ),

                  fillColor: isDark ?Colors.grey.shade400 :  Colors.grey.shade500,
                  filled: true,
                ),
              ),
            ),
            // enter password
        
            // forgot password
        
            // sign in button 
        
            // or continue with
        
            // new member, register
          ],
        ),
      ),
    );
  }
}
