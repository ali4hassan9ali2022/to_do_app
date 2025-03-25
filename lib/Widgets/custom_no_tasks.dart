import 'package:flutter/material.dart';

class CsutomNoTasks extends StatelessWidget {
  const CsutomNoTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.menu, size: 100.0, color: Colors.grey),
              Text(
                'No tasks Yet, Please add some tasks!',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        );
  }
}