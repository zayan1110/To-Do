import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomPage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:todo_app/pages/home_page.dart';

// void main() {
//   Hive.initFlutter();
//   Hive.openBox('mybox');
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomPage(),
//       theme: ThemeData(primarySwatch: Colors.yellow),
//     );
//   }
// }