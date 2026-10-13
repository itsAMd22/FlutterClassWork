import 'package:flutter/material.dart';
import 'package:not_to_do_app/pages/homepage.dart';

class IntroButton extends StatelessWidget{
  final void Function()? onTap;
  final Widget? child;

  const IntroButton({
    super.key, 
    required this.onTap, 
    required this.child
  });


  Widget build(BuildContext context){
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40, 
        width: 40,
        decoration: BoxDecoration(
          color:  isDark ?Colors.grey.shade900 :  Colors.grey.shade400,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}