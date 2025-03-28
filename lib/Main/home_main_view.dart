import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubit/Theme_cubit/Theme_cubit.dart';
import 'package:to_do_app/Cubit/Theme_cubit/theme_state.dart';
import 'package:to_do_app/Cubit/cubit/database_cubit.dart';

import 'package:to_do_app/Widgets/custom_bottom_nav_bar.dart';
import 'package:to_do_app/Widgets/custom_show_bottom_sheet.dart';

class HomeMainView extends StatelessWidget {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatabaseCubit, DatabaseState>(
      listener: (context, state) {
        if (state is AppInsertDatabase) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<DatabaseCubit>(context);
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed: () {
              if (cubit.isChecked) {
                if (cubit.keyState.currentState?.validate() ?? true) {
                  cubit.insertToDatabase(
                    title: cubit.titleController,
                    time: cubit.timeController,
                    date: cubit.dateController,
                  );
                }
              } else {
                cubit.scaffoldKey.currentState!
                    .showBottomSheet((context) {
                      return CustomShowBottomSheet(cubit: cubit);
                    })
                    .closed
                    .then((value) {
                      cubit.changeBottomSheet(isShow: false, icon: Icons.edit);
                    });
                cubit.changeBottomSheet(isShow: true, icon: Icons.add);
                cubit.titleController.clear();
                cubit.timeController.clear();
                cubit.dateController.clear();
              }
            },
            child: Icon(cubit.iconData, color: Colors.white),
          ),
          key: cubit.scaffoldKey,
          appBar: AppBar(
        
            backgroundColor: Colors.teal,
            title: Text(
              cubit.titlePages[cubit.currentIndex],
              style: const TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<ThemeCubit>(context).togglrTheme();
                },
                icon: BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return Icon(
                      state is DarkThemeState
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    );
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: CustomBottomNavBar(
            onTap: (value) {
              cubit.changeIndex(value);
            },
            currentIndex: cubit.currentIndex,
          ),
          body: ConditionalBuilder(
            condition: true,
            builder: (context) => cubit.pages[cubit.currentIndex],
            fallback: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }
}
