import 'package:flutter/material.dart';
import 'package:to_do_app/Main/home_main_view.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeMainView(),
    );
  }
}