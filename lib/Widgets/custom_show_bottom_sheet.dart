import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/Cubit/Theme_cubit/Theme_cubit.dart';
import 'package:to_do_app/Cubit/Theme_cubit/theme_state.dart';
import 'package:to_do_app/Cubit/cubit/database_cubit.dart';
import 'package:to_do_app/Widgets/custom_text_form_field.dart';

class CustomShowBottomSheet extends StatelessWidget {
  const CustomShowBottomSheet({super.key, required this.cubit});
  final DatabaseCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: state is DarkThemeState ? Colors.black : Colors.grey[100],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            border: Border.all(color: Colors.grey, width: 2),
          ),
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
                      cubit.timeController.text =
                          value?.format(context).toString() ?? "";
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
                      if (value != null) {
                        cubit.dateController.text = DateFormat?.yMMMd().format(
                          value,
                        );
                      } else {
                        cubit.dateController.text = "";
                      }
                    });
                  },
                  type: TextInputType.datetime,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        );
      },
    );
  }
}
