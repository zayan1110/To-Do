import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomPage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}