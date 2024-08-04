import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/them/them_provider.dart';
import 'package:todo_app/todo_app.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: TodoApp(),
  ));
}
