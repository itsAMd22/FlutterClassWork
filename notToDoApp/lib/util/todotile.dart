import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget{
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFucntion;


  ToDoTile({
    super.key, 
    required this.taskName, 
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFucntion
  });
  
  @override
  Widget build(BuildContext context) {

    // Ask Flutter which theme is active right now
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final tileColor = isDark
        ? const Color.fromARGB(255, 255, 235, 58) // your current yellow (dark mode)
        : const Color(0xFFFFF3C4);   
        
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        key: ValueKey(taskName), // Add a unique key so Flutter tracks state changes
        
        endActionPane: ActionPane(
          extentRatio: 0.25, // Explicit width for action button (25% of tile)
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFucntion,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        
        child: Container(
          padding: const EdgeInsets.all(25),
          
          decoration: BoxDecoration(
            color: tileColor,
            borderRadius: BorderRadius.circular(12),
          ),
          
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
                checkColor: const Color.fromARGB(255, 255, 254, 254),
                side: const BorderSide(color: Colors.black54, width: 2),
              ),
              
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.black87,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: const Color.fromARGB(255, 3, 3, 3),
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}