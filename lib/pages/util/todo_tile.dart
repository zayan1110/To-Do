
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String TaskName;
  final bool taskcombleted;
  Function(bool?) onChanged;
  Function(BuildContext)?deleteFunction;

  ToDoTile(
      {super.key,
      required this.TaskName,
      required this.taskcombleted,
      required this.onChanged,
            required this.deleteFunction,

      
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
motion: StretchMotion(),
children:[
  SlidableAction(
    onPressed: deleteFunction,
    icon: Icons.delete,
    backgroundColor: Colors.red,
borderRadius: BorderRadius.circular(12),
   )
]

        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(
                value: taskcombleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                TaskName,
                style: TextStyle(
                  decoration: taskcombleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
