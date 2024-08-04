import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/setting_page.dart';
import 'package:todo_app/them/them.dart';
import 'package:todo_app/them/them_provider.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/settingPage': (context) => SettingPage(),
      },
    );
  }
}
