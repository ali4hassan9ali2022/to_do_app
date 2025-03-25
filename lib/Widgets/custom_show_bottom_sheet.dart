import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/Cubit/create_databaes/create_cubit.dart';
import 'package:to_do_app/Widgets/custom_text_form_field.dart';

class CustomShowBottomSheet extends StatelessWidget {
  const CustomShowBottomSheet({super.key, required this.cubit});
  final AppCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(20),
      child: Form(
        key: cubit.keyState,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              hintText: "Title",
              prefixIcon: Icons.title,
              controller: cubit.titleController,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return "required";
                }
                return null;
              },
              onTap: () {},
              type: TextInputType.text,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: "time",
              prefixIcon: Icons.watch_later_outlined,
              controller: cubit.timeController,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return "required";
                }
                return null;
              },
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((value) {
                  cubit.timeController.text = value!.format(context).toString();
                });
              },
              type: TextInputType.datetime,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: "date",
              prefixIcon: Icons.watch_later_outlined,
              controller: cubit.dateController,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return "required";
                }
                return null;
              },
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.parse("2030-09-08"),
                ).then((value) {
                  cubit.dateController.text = DateFormat.yMMMd().format(value!);
                });
              },
              type: TextInputType.datetime,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
