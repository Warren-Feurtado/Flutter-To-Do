import 'package:flutter/material.dart';

class ToDoListTile extends StatelessWidget {

  final String taskName;
  final bool taskDone;
  Function(bool?)? onChanged;


   ToDoListTile({
    super.key,
    required this.taskName,
    required this.taskDone,
    required this.onChanged,
   });

   

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: taskDone ? Color.fromARGB(69, 0, 0, 0) : Colors.teal ,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskDone, 
              onChanged: onChanged, 
              side: BorderSide(
                color: Colors.white
              ),
            ),
            Text(
              taskName,
              style: TextStyle(
                decoration: taskDone ? TextDecoration.lineThrough : TextDecoration.none,
                fontSize: 17,
                color: Colors.white
                ),
            ),
          ],
        ),
      ),
    );
  }
}