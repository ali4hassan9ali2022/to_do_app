import 'package:flutter/material.dart';
import 'package:to_do_app/View/new_task_view.dart';

class HomeMainView extends StatelessWidget {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Tasks")),
      body: const NewTaskView(),
    );
  }
}
