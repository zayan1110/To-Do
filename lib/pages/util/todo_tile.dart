import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ToDoTile extends StatefulWidget {
  final String TaskName;
  final bool taskcombleted;
  final Function(bool?) onChanged;
  final Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.TaskName,
    required this.taskcombleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  _ToDoTileState createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  List<String> _dueDates = [];
  TextEditingController _dateController = TextEditingController();
  bool _showDateField = true;

  final _myBox = Hive.box('MyBox');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: widget.deleteFunction,
            icon: Icons.delete,
            backgroundColor: Color.fromARGB(255, 64, 68, 71),
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: widget.taskcombleted,
                    onChanged: widget.onChanged,
                    activeColor: Theme.of(context).colorScheme.background,
                  ),
                  Text(
                    widget.TaskName,
                    style: TextStyle(
                      decoration: widget.taskcombleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
