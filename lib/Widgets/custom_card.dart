import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: [
          const CircleAvatar(radius: 40, child: Text("2:50 AM")),
          const SizedBox(width: 20),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "title",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("date", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {
              // BlocProvider.of<AppCubit>(context).update(status: "Done", id: tasks['id']);
            },
            icon: const Icon(Icons.check_box, color: Colors.blue),
          ),
          IconButton(
            onPressed: () {
              // BlocProvider.of<AppCubit>(context).update(status: "archive", id: tasks['id']);
            },
            icon: const Icon(Icons.archive, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
