

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/pages/util/dialog_Box.dart';
import 'package:todo_app/pages/util/todo_tile.dart';


class HomPage extends StatefulWidget {


  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {

final _myBox = Hive.box('MyBox');

ToDoDataBase db = ToDoDataBase();
@override
  void initState() {

if(_myBox.get("TODOLIST") == null){

db.createInitialData();

}
else{

db.loadData();
}

    super.initState();
  }


final _controller = TextEditingController();




void CheckBoxChanged (bool? value , int index){
  setState(() {
   db. toDoList[index][1] = !db.toDoList[index][1];
  });
db.updataDataBase();
}

void SaveNewTask(){

setState(() {
 db.toDoList.add([_controller.text,false]);
});
  Navigator.of(context).pop();
_controller.clear();


db.updataDataBase();


} 


void CreatNewTask(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return DialogBox(
        controller:_controller ,
        onSave: SaveNewTask,
        onCancel: Navigator.of(context).pop,

      );
      
    },
  );
}

void deleteTask(int index){
setState(() {
 db.toDoList.removeAt(index);
});
db.updataDataBase();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        
        title: Center(child: Text('TO DO')),
        elevation: 0,
      ),
floatingActionButton: FloatingActionButton(
  onPressed: () => CreatNewTask(context),
  child: Icon(Icons.add),
),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            TaskName: db.toDoList[index][0],
           taskcombleted: db.toDoList[index][1],
           onChanged: (value) => CheckBoxChanged(value, index,),
           deleteFunction: (context) => deleteTask(index)
             
           
           );
        },
        ),
    );
  }
}
