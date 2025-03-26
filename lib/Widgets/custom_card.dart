import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubit/DataBase/database_cubit.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.modle});
  final Map modle;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        BlocProvider.of<DatabaseCubit>(context).deleteData(id: modle['id']);
      },
      key: Key(modle['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            CircleAvatar(radius: 40, child: Text("${modle['time']}")),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${modle['title']}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${modle['date']}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {
                BlocProvider.of<DatabaseCubit>(
                  context,
                ).updateData(status: "done", id: modle['id']);
              },
              icon: const Icon(Icons.check_box, color: Colors.blue),
            ),
            IconButton(
              onPressed: () {
                BlocProvider.of<DatabaseCubit>(
                  context,
                ).updateData(status: "archive", id: modle['id']);
              },
              icon: const Icon(Icons.archive, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
