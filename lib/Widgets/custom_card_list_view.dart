import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Widgets/custom_card.dart';

class CustomCardListView extends StatelessWidget {
  const CustomCardListView({super.key, required this.task});
  final List<Map> task;
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: task.isNotEmpty,
      builder: (context) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return const CustomCard();
          },
          separatorBuilder:
              (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(start: 24),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
          itemCount: task.length,
        );
      },
      fallback: (context) {
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
      },
    );
  }
}
