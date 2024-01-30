import 'package:flutter/material.dart';
import 'pages/todo_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoHome(),
      theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
}
